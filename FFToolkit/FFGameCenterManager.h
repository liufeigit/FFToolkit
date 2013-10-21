//
//  FFGameCenterManager.h
//  FortyTwo
//
//  Created by Forrest Ye on 9/4/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

// frameworks
#import <GameKit/GameKit.h>


@interface FFGameCenterManager : NSObject <GKGameCenterControllerDelegate>

@property (nonatomic, readonly) BOOL gameCenterEnabled;

+ (instancetype)sharedManager;

- (void)reportScore:(int64_t)score forLeaderBoardIdentifier:(NSString *)identifier;

- (void)reportAchievementWithIdentifier:(NSString *)identifier;

- (void)reportAchievementWithIdentifier:(NSString *)identifier percentComplete:(double)percent;

- (void)resetAchievements;

# pragma mark

- (void)presentGameCenterViewControllerFromViewController:(UIViewController *)viewController;

- (void)presentGameCenterSigninViewControllerFromViewController:(UIViewController *)viewController;


@end
