//
//  BNQButton.m
//  Banqi
//
//  Created by Forrest Ye on 7/21/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFLabeledButton.h"


@implementation FFLabeledButton


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    self.backgroundColor = [UIColor clearColor];

    _textLabel = [[FFLabel alloc] init];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.textColor = self.defaultTextColor;
    self.textLabel.backgroundColor = [UIColor clearColor];

    [self addSubview:self.textLabel];


    NSDictionary *views = NSDictionaryOfVariableBindings(_textLabel);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_textLabel]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_textLabel]|" options:0 metrics:nil views:views]];
  }

  return self;
}


- (void)setPressed:(BOOL)pressed {
  @synchronized(self) {
    [super setPressed:pressed];

    if (pressed) {
      self.textLabel.textColor = self.pressedTextColor;
    } else {
      self.textLabel.textColor = self.defaultTextColor;
    }
  }
}


- (void)setDefaultTextColor:(UIColor *)defaultTextColor {
  _defaultTextColor = defaultTextColor;
  self.textLabel.textColor = defaultTextColor;
}


@end
