//
//  MSNScrollableViewController.m
//  MineSweeper Neue
//
//  Created by Forrest Ye on 10/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFScrollableViewController.h"


@interface FFScrollableViewController ()

@end


@implementation FFScrollableViewController


- (UIScrollView *)scrollView {
  @throw @"should override";
}

-(BOOL)displayShadowUnderNavigationBar {
  return YES;
}


@end
