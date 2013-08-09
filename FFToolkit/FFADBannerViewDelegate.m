//
//  FFADBannerViewDelegate.m
//  FFToolkit
//
//  Created by Forrest Ye on 8/9/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFADBannerViewDelegate.h"


@interface FFADBannerViewDelegate ()

@property (nonatomic) ADBannerView *adBannerView;
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
      banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);

      self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, CGRectGetHeight(banner.frame), 0);
      self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, CGRectGetHeight(banner.frame), 0);
    }];

    self.adBannerViewVisible = YES;
  }
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"ad failed to load, %@", error.debugDescription);

  if (self.adBannerViewVisible) {
    [UIView animateWithDuration:0.7 animations:^{
      banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);

      self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, 0, 0);
      self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0, 0, 0);
    }];

    self.adBannerViewVisible = NO;
  }
}


@end
