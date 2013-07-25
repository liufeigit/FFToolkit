//
//  PNLHistoryManager.m
//  PhoneNumberLookup
//
//  Created by Forrest Ye on 7/13/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFLookupHistoryManager.h"

#import "FFSimpleArrayStore.h"


@interface FFLookupHistoryManager ()

@property FFSimpleArrayStore *arrayStore;

@end


@implementation FFLookupHistoryManager


+ (instancetype)defaultManager {
  static FFLookupHistoryManager *_instance = nil;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });

  return _instance;
}


- (instancetype)init {
  self = [super init];

  if (self) {
    _arrayStore = [FFSimpleArrayStore storeWithIdentifier:@"kFFLookupHistoryManagerRecentLookupKey"];
  }

  return self;
}


- (void)clearHistory {
  [self.arrayStore removeAllObjects];
}


- (void)addLookup:(NSString *)lookup {
  [self.arrayStore addObject:lookup removeDuplicates:YES];
}


- (void)removeLookupHistoryAtIndex:(NSUInteger)index {
  [self.arrayStore removeObjectAtIndex:index];
}


- (NSArray *)recentLookups {
  return [self.arrayStore allObjects];
}


@end
