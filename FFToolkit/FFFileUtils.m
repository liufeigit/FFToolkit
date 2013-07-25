//
//  FFFileUtils.m
//  Alien Pics
//
//  Created by Forrest Ye on 7/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFFileUtils.h"

@implementation FFFileUtils


+ (NSString *)documentDirectoryPath {
  return NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)[0];
}


+ (NSString *)cacheDirectoryPath {
  return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}


+ (void)createCacheDirectoryNamed:(NSString *)cacheDirectoryName {
  NSString *path = [self cacheDirectoryPathForName:cacheDirectoryName];

  if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];

    NSLog(@"cache directory created at %@", path);
  }
}


+ (NSData *)cachedDataNamed:(NSString *)cachedDataName {
  NSString *path = [self cacheFilePathForName:cachedDataName];

  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    NSLog(@"retrieving cached data at path %@", path);

    return [NSData dataWithContentsOfFile:path];
  } else {
    NSLog(@"-----------------------------------------------------");
    NSLog(@"cached data does not exist at path %@", path);

    return nil;
  }
}


+ (void)writeJSONData:(id)JSON toCacheWithName:(NSString *)cachedDataName {
  NSString *path = [self cacheFilePathForName:cachedDataName];

  NSString *directoryPath = [path stringByDeletingLastPathComponent];

  [self createDirectoryIfNeeded:directoryPath];

  NSData *data = [NSJSONSerialization dataWithJSONObject:JSON options:NSJSONWritingPrettyPrinted error:nil];

  NSLog(@"writing cache to path %@", path);

  [data writeToFile:path atomically:YES];
}


+ (void)writeData:(NSData *)data toCacheWithName:(NSString *)cachedDataName {
  NSString *path = [self cacheFilePathForName:cachedDataName];

  NSString *directoryPath = [path stringByDeletingLastPathComponent];

  [self createDirectoryIfNeeded:directoryPath];

  [data writeToFile:path atomically:YES];
}


+ (NSUInteger)numberOfFilesInCacheDirectoryNamed:(NSString *)cacheDirectoryName {
  NSString *path = [self cacheDirectoryPathForName:cacheDirectoryName];

  return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil].count;
}


+ (NSUInteger)sizeOfFilesInMBInCacheDirectoryNamed:(NSString *)cacheDirectoryName {
  NSString *path = [self cacheDirectoryPathForName:cacheDirectoryName];

  double totalSize = 0.0;
  for (NSString *fileName in [self fileNamesInCacheDirectoryNamed:cacheDirectoryName]) {
    NSString *filePath = [path stringByAppendingPathComponent:fileName];

    totalSize += [[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil] fileSize];
  }

  return ceil(totalSize / 1000 / 1000);
}


+ (void)removeFilesInCacheDirectoryNamed:(NSString *)cacheDirectoryName {
  NSString *path = [self cacheDirectoryPathForName:cacheDirectoryName];

  [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


+ (NSArray *)fileNamesInCacheDirectoryNamed:(NSString *)cacheDirectoryName {
  NSString *path = [self cacheDirectoryPathForName:cacheDirectoryName];

  return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
}


+ (NSString *)contentOfCachedFileWithName:(NSString *)cachedDataName {
  NSString *path = [self cacheFilePathForName:cachedDataName];

  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
  }

  return nil;
}


# pragma mark - private


+ (NSString *)cacheDirectoryPathForName:(NSString *)cacheDirectoryName {
  return [[self cacheDirectoryPath] stringByAppendingPathComponent:cacheDirectoryName];
}


+ (NSString *)cacheFilePathForName:(NSString *)cacheFileName {
  return [[self cacheDirectoryPath] stringByAppendingPathComponent:cacheFileName];
}


+ (void)createDirectoryIfNeeded:(NSString *)directoryPath {
  if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath]) {
    [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];

    NSLog(@"cache directory %@ created", directoryPath);
  }
}


@end
