//
//  FFAppDelegate.h
//  FFToolkit
//
//  Created by Forrest Ye on 8/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FFAppDelegate : UIResponder


@property (nonatomic) UIWindow *window;


+ (instancetype)sharedDelegate;

- (void)changeRootViewControllerToViewController:(UIViewController *)newRootViewController;


@end
