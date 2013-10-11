//
//  MSNNavigationBar.m
//  MineSweeper Neue
//
//  Created by Forrest Ye on 10/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFPagingNavigationBar.h"

#import "FFPagingNavigationBarBackButton.h"

// FFToolkit
#import "FFAssertions.h"

// frameworks
#import <QuartzCore/QuartzCore.h>


#ifndef RGB
#define RGB(__r__, __g__, __b__) [UIColor colorWithRed:__r__/255.0 green:__g__/255.0 blue:__b__/255.0 alpha:1]
#endif


@interface FFPagingNavigationBar ()

@property (nonatomic) FFPagingNavigationBarBackButton *backButton;

@property (nonatomic) UILabel *titleLabel;

@end


@implementation FFPagingNavigationBar


static UIFont *MSNDefaultTitleFont = nil;

const static CGFloat MSNPagingNavigationBarHeight = 44;
const static CGFloat MSNPagingNavigationBarTargetShadowOpacity = 0.5f;
const static CGFloat MSNPagingNavigationBarShadowOpacityAnimationDuration = 0.2f;


+ (void)setDefaultTitleFont:(UIFont *)defaultTitleFont {
  MSNDefaultTitleFont = defaultTitleFont;
}


# pragma mark


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = 0;

    [self setupTitleLabel];
    [self setupBackButton];
  }

  return self;
}

- (void)setupTitleLabel {
  CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) - 120, MSNPagingNavigationBarHeight);

  self.titleLabel = [[UILabel alloc] initWithFrame:frame];
  self.titleLabel.center = self.center;
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.titleLabel.textColor = RGB(70, 66, 66);

  if (MSNDefaultTitleFont) {
    self.titleLabel.font = MSNDefaultTitleFont;
  }

  [self addSubview:self.titleLabel];
}

- (void)setupBackButton {
  CGRect frame = CGRectMake(5, 0, MSNPagingNavigationBarHeight, MSNPagingNavigationBarHeight);

  self.backButton = [[FFPagingNavigationBarBackButton alloc] initWithFrame:frame];

  [self addSubview:self.backButton];
}


# pragma mark - KVO


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  FFAssertCurrentThreadIsMainThread();
  NSParameterAssert([object isKindOfClass:[UIScrollView class]]);

  @synchronized(self) {
    CGPoint newContentOffset = [change[@"new"] CGPointValue];

    if (newContentOffset.y > - MSNPagingNavigationBarHeight + 5) {
      // shadowOpacity animation
      {
        if (self.layer.shadowOpacity < MSNPagingNavigationBarTargetShadowOpacity) {
          CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
          animation.fromValue = @0.0f;
          animation.toValue = @(MSNPagingNavigationBarTargetShadowOpacity);
          animation.duration = MSNPagingNavigationBarShadowOpacityAnimationDuration;
          [self.layer addAnimation:animation forKey:@"shadowOpacity"];

          self.layer.shadowOpacity = MSNPagingNavigationBarTargetShadowOpacity;
        }
      }

    } else {
      // shadowOpacity animation
      {
        if (self.layer.shadowOpacity > 0) {
          CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
          animation.fromValue = @(MSNPagingNavigationBarTargetShadowOpacity);
          animation.toValue = @0.0f;
          animation.duration = MSNPagingNavigationBarShadowOpacityAnimationDuration;
          [self.layer addAnimation:animation forKey:@"shadowOpacity"];

          self.layer.shadowOpacity = 0;
        }
      }
    }
  }
}


@end
