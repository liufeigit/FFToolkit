//
//  FFAssertions.h
//  FFToolkit
//
//  Created by Forrest Ye on 8/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#define FFAssertCurrentThreadIsMainThread() \
    NSAssert([NSThread currentThread] == [NSThread mainThread], \
    @"should be called in main thread")

#define FFAssertCurrentThreadIsNotMainThread() \
    NSAssert([NSThread currentThread] != [NSThread mainThread], \
    @"should not be called in main thread")
