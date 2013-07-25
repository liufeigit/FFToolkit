//
//  FFListViewController.m
//  Alien Pics
//
//  Created by Forrest Ye on 7/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFListViewController.h"


@implementation FFListViewController


- (instancetype)init {
  self = [super init];

  if (self) {
    _tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
  }

  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];

  [self.view addSubview:self.tableView];
  [self setupUIConstraints];

  _cellClass = [UITableViewCell class];

  [self.tableView registerClass:self.cellClass forCellReuseIdentifier:NSStringFromClass(self.cellClass)];
}


- (void)setupUIConstraints {
  NSDictionary *views = NSDictionaryOfVariableBindings(_tableView);
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_tableView]|" options:0 metrics:nil views:views]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:views]];
}


@end
