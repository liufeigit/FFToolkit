//
//  FFADBannerViewDelegate.h
//  FFToolkit
//
//  Created by Forrest Ye on 8/9/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <iAd/iAd.h>


@interface FFADBannerViewDelegate : NSObject <ADBannerViewDelegate>


- (instancetype)initWithScrollView:(UIScrollView *)scrollView;


@end
