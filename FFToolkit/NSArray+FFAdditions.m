//
//  NSArray+FFAdditions.m
//  Banqi
//
//  Created by Forrest Ye on 7/19/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "NSArray+FFAdditions.h"

#import "NSMutableArray+FFAdditions.h"


@implementation NSArray (FFAdditions)


- (id)sample {
  return self[arc4random() % self.count];
}


- (NSArray *)sample:(NSUInteger)count {
  NSParameterAssert(self.count >= count);

  NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
  [mutableArray shuffle];

  return [mutableArray subarrayWithRange:NSMakeRange(0, count)];
}


- (NSArray *)uniq {
  return [[NSSet setWithArray:self] allObjects];
}


@end
