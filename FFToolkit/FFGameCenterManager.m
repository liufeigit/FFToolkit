//
//  FFGameCenterManager.m
//  FortyTwo
//
//  Created by Forrest Ye on 9/4/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFGameCenterManager.h"

// FFToolkit
#import "FFSimpleKeyValueStore.h"


@interface FFGameCenterManager ()

@property (nonatomic) BOOL gameCenterEnabled;
@property (nonatomic) FFSimpleKeyValueStore *keyValueStore;
@property (nonatomic, weak) UIViewController *currentViewController;

@end


@implementation FFGameCenterManager


+ (instancetype)sharedManager {
  static FFGameCenterManager *_instance = nil;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });

  return _instance;
}


# pragma mark - private


- (id)init {
  self = [super init];

  if (self) {
    [self setupGameCenter];
    self.keyValueStore = [FFSimpleKeyValueStore defaultStore];
  }

  return self;
}

- (void)setupGameCenter {
  __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];

  localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error) {
    if (viewController) {
      // don't present this view controller for now
      NSLog(@"user not logged into game center");
      self.gameCenterEnabled = NO;
    } else if (localPlayer.isAuthenticated) {
      NSLog(@"game center enabled!");
      self.gameCenterEnabled = YES;
    } else {
      NSLog(@"game center disabled!");
      self.gameCenterEnabled = NO;
    }
  };
}


# pragma mark - leaderboard score reporting


- (void)reportScore:(int64_t)score forLeaderBoardIdentifier:(NSString *)identifier {
  if (self.gameCenterEnabled) {
    GKScore *scoreReporter = [[GKScore alloc] initWithCategory:identifier];
    scoreReporter.value = score;
    scoreReporter.context = 0;

    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
      if (error) {
        NSLog(@"Error in reporting score: %@", error.debugDescription);
      } else {
        NSLog(@"Score reported for %@ : %lld", identifier, score);
      }
    }];
  }
}


# pragma mark - achievement reporting


- (void)reportAchievementWithIdentifier:(NSString *)identifier {
  [self reportAchievementWithIdentifier:identifier percentComplete:100];
}

- (void)reportAchievementWithIdentifier:(NSString *)identifier percentComplete:(double)percent {
  percent = MIN(percent, 100);

  NSString *achievementCompletedKey = [NSString stringWithFormat:@"achievementCompleted.%@", identifier];

  if ([self.keyValueStore getBOOLValueWithKey:achievementCompletedKey defaultValue:NO]) {
    NSLog(@"According to local cache, achievement has already been accomplished previously!");
    return;
  }

  if (self.gameCenterEnabled) {
    GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier:identifier];

    if (achievement) {
      if (achievement.completed) {
        // TODO: this seems never reached. should investigate
        NSLog(@"achievement already completed");
        return;
      }

      achievement.showsCompletionBanner = YES;

      achievement.percentComplete = percent;

      [achievement reportAchievementWithCompletionHandler:^(NSError *error) {
        if (error != nil) {
          NSLog(@"Error in reporting achievements: %@", error.debugDescription);
        } else {
          NSLog(@"achievement reported: %@", achievement);

          if (percent >= 100) {
            [self.keyValueStore storeBOOLValue:YES forKey:achievementCompletedKey];
          }
        }
      }];
    }
  }
}


# pragma mark - reset achievements


- (void)resetAchievements {
  // Clear all progress saved on Game Center.
  [GKAchievement resetAchievementsWithCompletionHandler:^(NSError *error) {
    if (error != nil) {
      NSLog(@"error while resetting achievements, %@", error.debugDescription);
    } else {
      NSLog(@"game center achievements reset completed");
    }
  }];
}


# pragma mark


- (void)presentGameCenterViewControllerFromViewController:(UIViewController *)viewController {
  self.currentViewController = viewController;

  GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];

  if (gameCenterController != nil) {
    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
    gameCenterController.leaderboardTimeScope = GKLeaderboardTimeScopeToday;
    gameCenterController.gameCenterDelegate = self;

    [self.currentViewController presentViewController:gameCenterController animated:YES completion:nil];
  }
}

- (void)presentGameCenterSigninViewControllerFromViewController:(UIViewController *)viewController {
  __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];

  localPlayer.authenticateHandler = ^(UIViewController *signinViewController, NSError *error) {
    if (signinViewController) {
      [viewController presentViewController:signinViewController animated:YES completion:nil];
    } else {
      NSLog(@"failed %@", error.debugDescription);
    }
  };


}


# pragma mark - GKGameCenterControllerDelegate


- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {
  [self.currentViewController dismissViewControllerAnimated:YES completion:nil];
  self.currentViewController = nil;
}


@end
