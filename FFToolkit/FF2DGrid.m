//
//  FF2DGrid.m
//  GOG
//
//  Created by Forrest Ye on 9/10/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FF2DGrid.h"


@interface FF2DGrid ()

@property (nonatomic) NSUInteger rowNumber;
@property (nonatomic) NSUInteger columnNumber;

@end


static NSUInteger FF2DGridUniverseWidth, FF2DUniverseHeight;

static NSMutableArray *FF2DGridAllGrids = nil;


@implementation FF2DGrid


+ (void)setUniverseWidth:(NSUInteger)width height:(NSUInteger)height {
  FF2DGridUniverseWidth = width;
  FF2DUniverseHeight = height;

  FF2DGridAllGrids = [NSMutableArray arrayWithCapacity:width * height];

  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      FF2DGridAllGrids[i * width + j] = [[self alloc] initWithRowNumber:i columnNumber:j];
    }
  }
}


# pragma mark - private


- (instancetype)initWithRowNumber:(NSUInteger)rowNumber columnNumber:(NSUInteger)columnNumber {
  self = [self init];

  if (self) {
    self.rowNumber = rowNumber;
    self.columnNumber = columnNumber;
  }

  return self;
}


# pragma mark


- (NSUInteger)internalIndex {
  return self.indexInCache;
}

+ (instancetype)gridAtRow:(NSUInteger)rowNumber column:(NSUInteger)columnNumber {
  return FF2DGridAllGrids[rowNumber * FF2DGridUniverseWidth + columnNumber];
}

- (NSUInteger)indexInCache {
  return self.rowNumber * FF2DGridUniverseWidth + self.columnNumber;
}

- (NSArray *)nearbyGrids {
  NSMutableArray *nearbyGrids = [NSMutableArray array];

  // top
  if (self.rowNumber > 0) {
    [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache - FF2DGridUniverseWidth]];

    // top-left
    if (self.columnNumber > 0) {
      [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache - FF2DGridUniverseWidth - 1]];
    }

    // top-right
    if (self.columnNumber < FF2DGridUniverseWidth - 1) {
      [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache - FF2DGridUniverseWidth + 1]];
    }
  }

  // left
  if (self.columnNumber > 0) {
    [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache - 1]];
  }

  // right
  if (self.columnNumber < FF2DGridUniverseWidth - 1) {
    [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache + 1]];
  }

  // bottom
  if (self.rowNumber < FF2DUniverseHeight - 1) {
    [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache + FF2DGridUniverseWidth]];

    // bottom-left
    if (self.columnNumber > 0) {
      [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache + FF2DGridUniverseWidth - 1]];
    }

    // bottom-right
    if (self.columnNumber < FF2DGridUniverseWidth - 1) {
      [nearbyGrids addObject:FF2DGridAllGrids[self.indexInCache + FF2DGridUniverseWidth + 1]];
    }
  }

  return nearbyGrids;
}


# pragma mark - deprecated


+ (instancetype)gridAtIndex:(NSUInteger)index {
  return FF2DGridAllGrids[index];
}

+ (NSArray *)allGrids {
  return FF2DGridAllGrids;
}


# pragma mark - introspection


- (NSString *)description {
  return [NSString stringWithFormat:@"(%d, %d)", self.rowNumber, self.columnNumber];
}


@end
