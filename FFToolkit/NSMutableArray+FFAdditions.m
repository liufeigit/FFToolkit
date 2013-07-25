//
//  NSMutableArray+FFAdditions.m
//  Banqi
//
//  Created by Forrest Ye on 7/17/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "NSMutableArray+FFAdditions.h"


@implementation NSMutableArray (FFAdditions)

// http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray

- (void)shuffle {
  NSUInteger count = [self count];

  for (NSUInteger i = 0; i < count; ++i) {

    // Select a random element between i and end of array to swap with.
    NSInteger nElements = count - i;
    NSInteger n = (arc4random() % nElements) + i;

    [self exchangeObjectAtIndex:i withObjectAtIndex:n];
  }
}


@end
