//
//  FFLabel.m
//  Banqi
//
//  Created by Forrest Ye on 7/22/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFLabel.h"


@implementation FFLabel


// from https://gist.github.com/marcoarment/2596057

- (void)drawTextInRect:(CGRect)rect {
  return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}


@end
