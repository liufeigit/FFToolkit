//
//  FFButtonDelegate.h
//  FFToolkit
//
//  Created by Forrest Ye on 9/19/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FFButton;


@protocol FFButtonDelegate <NSObject>

- (void)didPressedButton:(FFButton *)button;

@end
