//
//  FTTFrameManager.h
//  FortyTwo
//
//  Created by Forrest Ye on 9/4/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FFFrameManagerDelegate <NSObject>

- (void)frameManagerDidUpdateFrame;

@end


@interface FFFrameManager : NSObject

@property (nonatomic, weak) id<FFFrameManagerDelegate> delegate;

- (instancetype)initWithFrameRate:(NSUInteger)frameRate;

- (void)start;

- (void)pause;

- (BOOL)running;

@end
