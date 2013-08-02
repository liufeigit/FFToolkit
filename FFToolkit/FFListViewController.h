//
//  FFListViewController.h
//  Alien Pics
//
//  Created by Forrest Ye on 7/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


// Designated Initializer
// TODO: override initWithFrame and call [self init]?
- (instancetype)init;


@property (nonatomic) UITableView *tableView;

@property Class cellClass;


@end
