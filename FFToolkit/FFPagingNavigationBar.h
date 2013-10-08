//
//  MSNNavigationBar.h
//  MineSweeper Neue
//
//  Created by Forrest Ye on 10/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FFPagingNavigationBarBackButton;


@interface FFPagingNavigationBar : UIView

@property (nonatomic, readonly) FFPagingNavigationBarBackButton *backButton;

@property (nonatomic, readonly) UILabel *titleLabel;

+ (void)setDefaultTitleFont:(UIFont *)defaultTitleFont;

@end
