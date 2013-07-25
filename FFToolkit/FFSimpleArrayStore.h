//
//  FFSimpleStorage.h
//  freakypedia
//
//  Created by Forrest Ye on 7/15/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFSimpleArrayStore : NSObject


+ (instancetype)storeWithIdentifier:(NSString *)identifier;

- (void)removeAllObjects;

- (void)addObject:(id)object;

- (void)addObject:(id)object skipIfDuplicated:(BOOL)skipIfDuplicated;

- (void)addObject:(id)object removeDuplicates:(BOOL)removeDuplicates;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (NSArray *)allObjects;


@end
