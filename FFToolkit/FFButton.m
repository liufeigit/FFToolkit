//
//  FFButton.m
//  Banqi
//
//  Created by Forrest Ye on 7/22/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFButton.h"


@implementation FFButton


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    self.userInteractionEnabled = YES;
    self.exclusiveTouch = YES;
  }

  return self;
}


# pragma mark - touch handling


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  self.pressed = YES;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  // touch up inside
  if (CGRectContainsPoint(self.bounds, [touches.anyObject locationInView:self]) && self.pressed) {
    [self.delegate didPressedButton:self];
  }

  self.pressed = NO;
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
  self.pressed = NO;
}


@end
