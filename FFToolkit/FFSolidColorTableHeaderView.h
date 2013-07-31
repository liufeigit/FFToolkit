//
//  DictionaryTableHeaderView.h
//  Dictionary
//
//  Created by Forrest Ye on 7/2/13.
//
//

#import <UIKit/UIKit.h>

#ifndef RDP_DEFAULT_TABLE_SECTION_HEADER_COLOR
#define RDP_DEFAULT_TABLE_SECTION_HEADER_COLOR [UIColor colorWithRed:0.65 green:0.34 blue:0.28 alpha:1.0]
#endif

#ifndef RDP_DEFAULT_TABLE_SECTION_HEADER_HEIGHT
#define RDP_DEFAULT_TABLE_SECTION_HEADER_HEIGHT 30
#endif

@interface FFSolidColorTableHeaderView : UIView


+ (instancetype)viewWithText:(NSString *)text;

@property (nonatomic) UILabel *textLabel;


@end
