//
//  FFADBannerViewDelegate.m
//  FFToolkit
//
//  Created by Forrest Ye on 8/9/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFADBannerViewDelegate.h"

#import "CGGeometry+FFAdditions.h"


@interface FFADBannerViewDelegate ()

@property (nonatomic) BOOL adBannerViewVisible;
@property (nonatomic) UIScrollView *scrollView;

@end


@implementation FFADBannerViewDelegate


- (instancetype)initWithScrollView:(UIScrollView *)scrollView {
  self = [super init];

  if (self) {
    _scrollView = scrollView;

    _adBannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.scrollView.superview.bounds), 320, 50)];
    self.adBannerView.delegate = self;

    [self.scrollView.superview addSubview:self.adBannerView];

  }

  return self;
}


# pragma mark
# pragma mark - ADBannerViewDelegate


- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
  NSLog(@"ad loaded");

  if (!self.adBannerViewVisible) {
    [UIView animateWithDuration:0.7 animations:^{
      banner.center = CGPointOffset(banner.center, 0, -CGRectGetHeight(banner.frame));

      UIEdgeInsets newEdgeInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, CGRectGetHeight(banner.frame), 0);

      self.scrollView.contentInset = newEdgeInsets;
      self.scrollView.scrollIndicatorInsets = newEdgeInsets;
    }];

    self.adBannerViewVisible = YES;
  }
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"ad failed to load, %@", error.debugDescription);

  if (self.adBannerViewVisible) {
    [UIView animateWithDuration:0.7 animations:^{
      banner.center = CGPointOffset(banner.center, 0, CGRectGetHeight(banner.frame));

      UIEdgeInsets newEdgeInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, 0, 0);

      self.scrollView.contentInset = newEdgeInsets;
      self.scrollView.scrollIndicatorInsets = newEdgeInsets;
    }];

    self.adBannerViewVisible = NO;
  }
}


@end
