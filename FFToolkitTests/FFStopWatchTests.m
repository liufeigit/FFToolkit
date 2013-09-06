//
//  FFStopWatchTests.m
//  FFToolkit
//
//  Created by Forrest Ye on 9/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFStopWatchTests.h"

#import "FFStopWatch.h"


@interface FFStopWatchTests ()

@property (nonatomic) FFStopWatch *stopWatch;

@end


@implementation FFStopWatchTests


static CGFloat FTTMTimeTestAccuracy = 0.01;


- (void)setUp {
  [super setUp];

  self.stopWatch = [[FFStopWatch alloc] init];
}


- (void)testStopWatch {
  [self.stopWatch start];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 0.0, FTTMTimeTestAccuracy, @"0 when start");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 0.0, FTTMTimeTestAccuracy, @"0 when start");

  [self.stopWatch pause];

  [NSThread sleepForTimeInterval:0.1];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 0.0, FTTMTimeTestAccuracy, @"dont change when paused");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 0.0, FTTMTimeTestAccuracy, @"dont change when paused");

  [self.stopWatch resume];

  [NSThread sleepForTimeInterval:0.1];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 0.1, FTTMTimeTestAccuracy, @"records time");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 0.1, FTTMTimeTestAccuracy, @"records time");

  [self.stopWatch lap];

  [NSThread sleepForTimeInterval:0.2];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 0.2, FTTMTimeTestAccuracy, @"records lap");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 0.3, FTTMTimeTestAccuracy, @"records lap");

  [NSThread sleepForTimeInterval:1];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 1.2, FTTMTimeTestAccuracy, @"record time");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 1.3, FTTMTimeTestAccuracy, @"record time");

  [self.stopWatch pause];

  [NSThread sleepForTimeInterval:1];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 1.2, FTTMTimeTestAccuracy, @"dont change when paused");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 1.3, FTTMTimeTestAccuracy, @"dont change when paused");

  [self.stopWatch resume];
  [self.stopWatch lap];

  STAssertEqualsWithAccuracy(self.stopWatch.timeElapsed, 0.0, FTTMTimeTestAccuracy, @"lap");
  STAssertEqualsWithAccuracy(self.stopWatch.totalTimeElapsed, 1.3, FTTMTimeTestAccuracy, @"lap");
}


@end
