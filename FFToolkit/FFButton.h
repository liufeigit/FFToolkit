//
//  FFButton.h
//  Banqi
//
//  Created by Forrest Ye on 7/22/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FFButtonDelegate.h"


@interface FFButton : UIView


@property (nonatomic) BOOL pressed;

@property (nonatomic, weak) id<FFButtonDelegate> delegate;


@end
