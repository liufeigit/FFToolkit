//
//  FFArrayDataSource.m
//  FFToolkit
//
//  Created by Forrest Ye on 8/9/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFArrayDataSource.h"


@interface FFArrayDataSource ()

@property (nonatomic) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) FFArrayDataSourceTableViewCellConfigurationBlock configurationBlock;

@end


@implementation FFArrayDataSource


- (id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configurationBlock:(FFArrayDataSourceTableViewCellConfigurationBlock)configurationBlock {
  self = [super init];

  if (self) {
    self.items = items;
    self.cellIdentifier = cellIdentifier;
    self.configurationBlock = configurationBlock;
  }

  return self;
}


- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
  return self.items[indexPath.row];
}


# pragma mark
# pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                          forIndexPath:indexPath];

  self.configurationBlock(cell, [self itemAtIndexPath:indexPath]);

  return cell;
}


@end
