//
//  FFSimpleKeyValueStore.m
//  Alien Pics
//
//  Created by Forrest Ye on 7/15/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFSimpleKeyValueStore.h"

@implementation FFSimpleKeyValueStore


+ (instancetype)defaultStore {
  static FFSimpleKeyValueStore *_instance = nil;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] init];
  });

  return _instance;
}


# pragma mark
# pragma mark - general access methods


- (void)storeValue:(id)value forKey:(NSString *)key {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  [defaults setValue:value forKey:key];

  [defaults synchronize];

}


- (id)getValueWithKey:(NSString *)key {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  return [defaults valueForKey:key];
}


- (id)getValueWithKey:(NSString *)key defaultValue:(id)defaultValue {
  return [self getValueWithKey:key defaultValue:defaultValue storeDefaultValueIfNotPresent:NO];
}


- (id)getValueWithKey:(NSString *)key defaultValue:(id)defaultValue storeDefaultValueIfNotPresent:(BOOL)storeDefault {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  id value = [defaults valueForKey:key];

  if (value) {
    return value;
  }

  value = defaultValue;

  if (storeDefault) {
    [self storeValue:value forKey:key];
  }

  return value;
}


# pragma mark
# pragma mark - BOOL


- (void)storeBOOLValue:(BOOL)boolValue forKey:(NSString *)key {
  [self storeValue:@(boolValue) forKey:key];
}


- (BOOL)getBOOLValueWithKey:(NSString *)key {
  return [[self getValueWithKey:key] boolValue];
}


- (BOOL)getBOOLValueWithKey:(NSString *)key defaultValue:(BOOL)defaultValue {
  return [[self getValueWithKey:key defaultValue:@(defaultValue) storeDefaultValueIfNotPresent:NO] boolValue];
}


# pragma mark
# pragma mark - NSUInteger


- (void)storeNSUIntegerValue:(NSUInteger)intValue forKey:(NSString *)key {
  [self storeValue:@(intValue) forKey:key];
}


- (void)increaseNSUIntegerValueForKey:(NSString *)key {
  NSUInteger oldValue = [self getNSUIntegerValueWithKey:key defaultValue:0];
  [self storeNSUIntegerValue:oldValue + 1 forKey:key];
}


- (NSUInteger)getNSUIntegerValueWithKey:(NSString *)key {
  return [[self getValueWithKey:key] intValue];
}


- (NSUInteger)getNSUIntegerValueWithKey:(NSString *)key defaultValue:(NSUInteger)defaultValue {
  return [[self getValueWithKey:key defaultValue:@(defaultValue) storeDefaultValueIfNotPresent:NO] intValue];
}


@end
