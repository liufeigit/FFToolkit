//
//  NSString_FFRegexAdditions.h
//  freakypedia
//
//  Created by Forrest Ye on 7/15/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FFRegexAdditions)

- (NSString *)stringByMatchingRegexPattern:(NSString *)patternString;

- (BOOL)matchesRegexPattern:(NSString *)patternString;

@end
