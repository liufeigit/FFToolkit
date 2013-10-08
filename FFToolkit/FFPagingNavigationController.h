//
//  MSNNavigationController.h
//  MineSweeper Neue
//
//  Created by Forrest Ye on 10/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FFButtonDelegate.h"


@class FFScrollableViewController;


@interface FFPagingNavigationController : UIViewController <FFButtonDelegate>

@property (nonatomic, readonly) FFScrollableViewController *rootViewController;

- (instancetype)initWithRootViewController:(FFScrollableViewController *)rootViewController;

- (void)pushViewController:(FFScrollableViewController *)viewController;

- (void)goBack;

@end
