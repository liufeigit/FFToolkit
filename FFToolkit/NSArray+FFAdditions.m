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


- (NSArray *)uniq {
  return [[NSSet setWithArray:self] allObjects];
}


@end
