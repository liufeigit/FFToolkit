//
//  FF2DGrid.h
//  GOG
//
//  Created by Forrest Ye on 9/10/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FF2DGrid : NSObject

@property (nonatomic, readonly) NSUInteger rowNumber;
@property (nonatomic, readonly) NSUInteger columnNumber;

@property (nonatomic, readonly) NSArray *nearbyGrids;

+ (instancetype)gridAtRow:(NSUInteger)rowNumber column:(NSUInteger)columnNumber;

+ (void)setUniverseWidth:(NSUInteger)width height:(NSUInteger)height;

@end
