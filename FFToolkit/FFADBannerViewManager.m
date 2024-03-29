//
//  FFADBannerViewDelegate.m
//  FFToolkit
//
//  Created by Forrest Ye on 8/9/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFADBannerViewManager.h"


@interface FFADBannerViewManager ()

@property (nonatomic) BOOL adBannerViewVisible;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIView *containerView;

@end


@implementation FFADBannerViewManager


- (instancetype)initWithScrollView:(UIScrollView *)scrollView {
  self = [super init];

  if (self) {
    self.scrollView = scrollView;

    self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.scrollView.superview.bounds), 320, 50)];
    self.adBannerView.delegate = self;

    [self.scrollView.superview addSubview:self.adBannerView];

  }

  return self;
}


- (instancetype)initWithContainerView:(UIView *)containerView {
  self = [super init];

  if (self) {
    self.containerView = containerView;

    self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.containerView.bounds), 320, 50)];
    self.adBannerView.delegate = self;

    [self.containerView addSubview:self.adBannerView];
  }

  return self;
}


# pragma mark


- (void)disable {
  [self.adBannerView removeFromSuperview];
  self.adBannerView.delegate = nil;
  self.adBannerView = nil;
}


# pragma mark - ADBannerViewDelegate


- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
  NSLog(@"------ FFAdBannerViewDelegate ------ ad loaded");

  if (!self.adBannerViewVisible) {
    [UIView animateWithDuration:0.7 animations:^{
      banner.center = CGPointMake(banner.center.x, banner.center.y - CGRectGetHeight(banner.frame));

      if (self.scrollView) {
        UIEdgeInsets newEdgeInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, CGRectGetHeight(banner.frame), 0);

        self.scrollView.contentInset = newEdgeInsets;
        self.scrollView.scrollIndicatorInsets = newEdgeInsets;
      }
    }];

    self.adBannerViewVisible = YES;
  }
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"------ FFAdBannerViewDelegate ------ ad failed to load, %@", error.debugDescription);

  if (self.adBannerViewVisible) {
    [UIView animateWithDuration:0.7 animations:^{
      banner.center = CGPointMake(banner.center.x, banner.center.y + CGRectGetHeight(banner.frame));

      if (self.scrollView) {
        UIEdgeInsets newEdgeInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, 0, 0);

        self.scrollView.contentInset = newEdgeInsets;
        self.scrollView.scrollIndicatorInsets = newEdgeInsets;
      }
    }];

    self.adBannerViewVisible = NO;
  }
}


@end
