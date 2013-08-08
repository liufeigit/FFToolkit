//
//  FFAppDelegate.m
//  FFToolkit
//
//  Created by Forrest Ye on 8/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFAppDelegate.h"


@implementation FFAppDelegate


+ (instancetype)sharedDelegate {
  return [UIApplication sharedApplication].delegate;
}


- (void)changeRootViewControllerToViewController:(UIViewController *)newRootViewController {
  UIView *oldRootViewControllerView = self.window.rootViewController.view;

  newRootViewController.view.transform = oldRootViewControllerView.transform;
  newRootViewController.view.frame = oldRootViewControllerView.frame;

  [UIView transitionFromView:oldRootViewControllerView
                      toView:newRootViewController.view
                    duration:0.5
                     options:UIViewAnimationOptionTransitionCrossDissolve
                  completion:^(BOOL finished) {
                    self.window.rootViewController = newRootViewController;
                  }];
}


@end
