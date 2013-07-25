//
//  FFButton.m
//  Banqi
//
//  Created by Forrest Ye on 7/22/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFButton.h"


@interface FFButton ()

// used to make dragging detection feel more natural
// TODO: understand this better
@property CGPoint draggingOffset;


@end



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

  UITouch *aTouch = [touches anyObject];

  self.draggingOffset = [aTouch locationInView: self];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint currentLocation = [self currentLocationFromTouches:touches];

  // touch up inside
  if ([self containsTouchLocation:currentLocation] && self.pressed) {
    [self.delegate didPressedButton:self];
  }

  self.pressed = NO;
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
  self.pressed = NO;
}


# pragma mark - private


- (BOOL)containsTouchLocation:(CGPoint)location {
  CGRect collisionRect = CGRectOffset(self.frame, - self.bounds.size.width / 2, - self.bounds.size.height / 2);

  return CGRectContainsPoint(collisionRect, location);
}


- (CGPoint)currentLocationFromTouches:(NSSet *)touches {
  UITouch *aTouch = [touches anyObject];
  CGPoint location = [aTouch locationInView:self.superview];

  return CGPointMake(location.x - self.draggingOffset.x, location.y - self.draggingOffset.y);
}


@end
