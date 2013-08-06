//
//  FFFileUtils.h
//  Alien Pics
//
//  Created by Forrest Ye on 7/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFFileUtils : NSObject


+ (NSString *)documentDirectoryPath;

+ (NSString *)cacheDirectoryPath;

+ (void)createCacheDirectoryNamed:(NSString *)cacheDirectoryName;

+ (NSData *)cachedDataNamed:(NSString *)cachedDataName;


# pragma mark
# pragma mark - write data


+ (void)writeJSONData:(id)JSON toCacheWithName:(NSString *)cachedDataName;

+ (void)writeData:(NSData *)data toCacheWithName:(NSString *)cachedDataName;


# pragma mark
# pragma mark - read data


+ (NSUInteger)numberOfFilesInCacheDirectoryNamed:(NSString *)cacheDirectoryName;

+ (NSUInteger)sizeOfFilesInMBInCacheDirectoryNamed:(NSString *)cacheDirectoryName;

+ (void)removeFilesInCacheDirectoryNamed:(NSString *)cacheDirectoryName;

+ (NSArray *)fileNamesInCacheDirectoryNamed:(NSString *)cacheDirectoryName;

+ (NSString *)contentOfCachedFileWithName:(NSString *)cachedDataName;

+ (BOOL)cachedFileExist:(NSString *)cachedDataName;


@end
