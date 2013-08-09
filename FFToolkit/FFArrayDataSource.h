//
//  FFArrayDataSource.h
//  FFToolkit
//
//  Created by Forrest Ye on 8/9/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^FFArrayDataSourceTableViewCellConfigurationBlock)(id cell, id item);


// https://github.com/objcio/issue-1-lighter-view-controllers

@interface FFArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 configurationBlock:(FFArrayDataSourceTableViewCellConfigurationBlock)configurationBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
