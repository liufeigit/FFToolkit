//
//  FFSimpleStorage.m
//  freakypedia
//
//  Created by Forrest Ye on 7/15/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFSimpleArrayStore.h"


@interface FFSimpleArrayStore ()

@property (copy) NSString *identifier;

@end


@implementation FFSimpleArrayStore


+ (instancetype)storeWithIdentifier:(NSString *)identifier {
  return [[self alloc] initWithIdentifier:identifier];
}

- (instancetype)initWithIdentifier:(NSString *)identifier {
  self = [super init];
  if (self) {
    _identifier = [identifier copy];
  }

  return self;
}


# pragma mark - main


- (void)removeAllObjects {
  [self setObjects:@[]];
}

- (void)addObject:(id)object {
  [self addObject:object removeDuplicates:NO];
}

- (void)addObject:(id)object skipIfDuplicated:(BOOL)skipIfDuplicated {
  if (skipIfDuplicated && [[self allObjects] containsObject:object]) {
    return;
  }

  [self addObject:object];
}

- (void)addObject:(id)object removeDuplicates:(BOOL)removeDuplicates {
  NSMutableArray *objects = [[self allObjects] mutableCopy];

  [objects insertObject:object atIndex:0];

  if (removeDuplicates) {
    objects = [[[NSOrderedSet orderedSetWithArray:objects] array] mutableCopy];
  }

  [self setObjects:objects];
}

- (NSArray *)allObjects {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  NSArray *objects = [defaults objectForKey:self.identifier];

  if (!objects) {
    [self removeAllObjects];
  }

  return [defaults objectForKey:self.identifier];
}

- (NSUInteger)count {
  return self.allObjects.count;
}

- (void)removeObjectAtIndex:(NSUInteger)index {
  NSMutableArray *objects = [[self allObjects] mutableCopy];

  [objects removeObjectAtIndex:index];

  [self setObjects:objects];
}


# pragma mark - private


- (void)setObjects:(NSArray *)objects {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  [defaults setObject:objects forKey:self.identifier];

  [defaults synchronize];
}


@end
