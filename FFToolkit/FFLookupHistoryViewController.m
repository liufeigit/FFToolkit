//
//  PNLLookupHistoryViewController.m
//  PhoneNumberLookup
//
//  Created by Forrest Ye on 7/13/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFLookupHistoryViewController.h"

#import "FFLookupHistoryManager.h"

@interface FFLookupHistoryViewController ()

@end


@implementation FFLookupHistoryViewController


- (void)viewDidLoad {
  [super viewDidLoad];
}


# pragma mark
# pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [FFLookupHistoryManager defaultManager].recentLookups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.cellClass)];

  cell.textLabel.text = [self lookupHistory][indexPath.row];

  return cell;
}


# pragma mark delete history


- (NSArray *)lookupHistory {
  return [FFLookupHistoryManager defaultManager].recentLookups;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self.tableView beginUpdates];
    [[FFLookupHistoryManager defaultManager] removeLookupHistoryAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
  }
}


# pragma mark
# pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
