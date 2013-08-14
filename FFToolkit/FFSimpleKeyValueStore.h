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

# pragma mark - general access methods

- (void)storeValue:(id)value forKey:(NSString *)key;

- (id)getValueWithKey:(NSString *)key;

- (id)getValueWithKey:(NSString *)key defaultValue:(id)defaultValue;

- (id)getValueWithKey:(NSString *)key defaultValue:(id)defaultValue storeDefaultValueIfNotPresent:(BOOL)storeDefault;

# pragma mark - specific access methods

// BOOL
- (void)storeBOOLValue:(BOOL)boolValue forKey:(NSString *)key;

- (BOOL)getBOOLValueWithKey:(NSString *)key;

- (BOOL)getBOOLValueWithKey:(NSString *)key defaultValue:(BOOL)defaultValue;

// NSUInteger
- (void)storeNSUIntegerValue:(NSUInteger)intValue forKey:(NSString *)key;

- (NSUInteger)getNSUIntegerValueWithKey:(NSString *)key;

@end
