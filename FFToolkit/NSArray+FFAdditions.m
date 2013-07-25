//
//  NSArray+FFAdditions.m
//  Banqi
//
//  Created by Forrest Ye on 7/19/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "NSArray+FFAdditions.h"

@implementation NSArray (FFAdditions)

- (id)sample {
  return self[arc4random() % self.count];
}

@end
