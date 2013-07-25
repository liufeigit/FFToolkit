//
//  PNLHistoryManager.h
//  PhoneNumberLookup
//
//  Created by Forrest Ye on 7/13/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFLookupHistoryManager : NSObject


+ (instancetype)defaultManager;


- (void)clearHistory;

- (void)addLookup:(NSString *)lookup;

- (void)removeLookupHistoryAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSArray *recentLookups;


@end
