//
//  FFSimpleKeyValueStore.h
//  Alien Pics
//
//  Created by Forrest Ye on 7/15/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFSimpleKeyValueStore : NSObject


+ (instancetype)defaultStore;

- (void)storeValue:(id)value forKey:(id)key;

- (id)getValueWithKey:(id)key;

- (id)getValueWithKey:(id)key defaultValue:(id)defaultValue;

- (id)getValueWithKey:(id)key defaultValue:(id)defaultValue storeDefaultValueIfNotPresent:(BOOL)storeDefault;


@end
