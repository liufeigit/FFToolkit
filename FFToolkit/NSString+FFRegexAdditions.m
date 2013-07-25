//
//  FFRegexUtils.m
//  freakypedia
//
//  Created by Forrest Ye on 7/15/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "NSString+FFRegexAdditions.h"

@implementation NSString (FFRegexAdditions)

- (BOOL)matchesRegexPattern:(NSString *)patternString {
//  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\A[A-Za-z0-9][A-Za-z0-9_]{2,20}\\Z" options:0 error:nil];

  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternString options:0 error:nil];

  NSArray *matches = [regex matchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)];

  return matches.count == 1;
}


- (NSString *)stringByMatchingRegexPattern:(NSString *)patternString {
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternString options:0 error:nil];

  NSArray *matches = [regex matchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)];

  if (matches.count == 0) {
    return @"";
  }

  NSTextCheckingResult *result = matches[0];

  if (result.numberOfRanges == 0) {
    return @"";
  }

  return [self substringWithRange:[result rangeAtIndex:1]];
}


@end
