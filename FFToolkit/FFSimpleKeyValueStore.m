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


- (void)storeValue:(id)value forKey:(id)key {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  [defaults setValue:value forKey:key];

  [defaults synchronize];

}


- (id)getValueWithKey:(id)key {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  return [defaults valueForKey:key];
}


- (id)getValueWithKey:(id)key defaultValue:(id)defaultValue {
  return [self getValueWithKey:key defaultValue:defaultValue storeDefaultValueIfNotPresent:NO];
}


- (id)getValueWithKey:(id)key defaultValue:(id)defaultValue storeDefaultValueIfNotPresent:(BOOL)storeDefault {
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


@end
