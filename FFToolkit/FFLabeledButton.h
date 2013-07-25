//
//  BNQButton.h
//  Banqi
//
//  Created by Forrest Ye on 7/21/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFButton.h"
#import "FFLabel.h"


@interface FFLabeledButton : FFButton


@property (nonatomic, readonly) FFLabel *textLabel;

@property (nonatomic) UIColor *defaultTextColor;

@property (nonatomic) UIColor *pressedTextColor;


@end
