//
//  MSNPagingNavigationBarBackButton.m
//  MineSweeper Neue
//
//  Created by Forrest Ye on 10/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFPagingNavigationBarBackButton.h"

#ifndef RGB
#define RGB(__r__, __g__, __b__) [UIColor colorWithRed:__r__/255.0 green:__g__/255.0 blue:__b__/255.0 alpha:1]
#endif


@interface FFPagingNavigationBarBackButton ()

@property (nonatomic) UIColor *color;

@end


@implementation FFPagingNavigationBarBackButton


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    self.color = RGB(70, 66, 66);

    self.backgroundColor = [UIColor clearColor];
  }

  return self;
}

- (void)setPressed:(BOOL)pressed {
  @synchronized(self) {
    [super setPressed:pressed];

    if (pressed) {
      self.color = RGB(211, 211, 211);
    } else {
      self.color = RGB(70, 66, 66);
    }
  }

  [self setNeedsDisplay];
}


# pragma mark - custom drawing


- (void)drawRect:(CGRect)rect {
  CGContextRef currentContext = UIGraphicsGetCurrentContext();
  // default size is 88x88
  CGContextScaleCTM(currentContext, CGRectGetHeight(rect) / 88, CGRectGetHeight(rect) / 88);

  //// Page-1
  {
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(20.14, 42.14)];
    [bezierPath addCurveToPoint: CGPointMake(20, 43.2) controlPoint1: CGPointMake(20.05, 42.47) controlPoint2: CGPointMake(20, 42.83)];
    [bezierPath addCurveToPoint: CGPointMake(20.2, 44.45) controlPoint1: CGPointMake(20, 43.64) controlPoint2: CGPointMake(20.07, 44.05)];
    [bezierPath addCurveToPoint: CGPointMake(21.39, 46.57) controlPoint1: CGPointMake(20.38, 45.23) controlPoint2: CGPointMake(20.78, 45.96)];
    [bezierPath addLineToPoint: CGPointMake(36.25, 61.43)];
    [bezierPath addCurveToPoint: CGPointMake(42.61, 61.43) controlPoint1: CGPointMake(38, 63.19) controlPoint2: CGPointMake(40.85, 63.18)];
    [bezierPath addCurveToPoint: CGPointMake(42.61, 55.07) controlPoint1: CGPointMake(44.36, 59.67) controlPoint2: CGPointMake(44.36, 56.82)];
    [bezierPath addLineToPoint: CGPointMake(34.74, 47.2)];
    [bezierPath addLineToPoint: CGPointMake(62, 47.2)];
    [bezierPath addCurveToPoint: CGPointMake(66, 43.2) controlPoint1: CGPointMake(64.21, 47.2) controlPoint2: CGPointMake(66, 45.4)];
    [bezierPath addCurveToPoint: CGPointMake(62, 39.2) controlPoint1: CGPointMake(66, 40.99) controlPoint2: CGPointMake(64.21, 39.2)];
    [bezierPath addLineToPoint: CGPointMake(34.66, 39.2)];
    [bezierPath addLineToPoint: CGPointMake(42.61, 31.25)];
    [bezierPath addCurveToPoint: CGPointMake(42.61, 24.89) controlPoint1: CGPointMake(44.37, 29.5) controlPoint2: CGPointMake(44.36, 26.65)];
    [bezierPath addCurveToPoint: CGPointMake(36.25, 24.89) controlPoint1: CGPointMake(40.85, 23.14) controlPoint2: CGPointMake(38, 23.14)];
    [bezierPath addLineToPoint: CGPointMake(21.39, 39.75)];
    [bezierPath addCurveToPoint: CGPointMake(20.14, 42.14) controlPoint1: CGPointMake(20.71, 40.42) controlPoint2: CGPointMake(20.3, 41.26)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;

    bezierPath.usesEvenOddFillRule = YES;

    [self.color setFill];

    [bezierPath fill];
  }
}


@end
