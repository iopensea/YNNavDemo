//
//  YNCheckListViewController.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNCheckListViewController.h"

static NSString *CellIdentifier = @"Cell";

@implementation YNCheckListViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Check One";
        self.rowImage = [UIImage imageNamed:@"common_icon_checkmark"];
        self.snacks = @[@"Who Hash", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"12", @"13", @"15", @"16", @"17", @"18", @"19", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...2"];
        self.selectedSnack = NSNotFound;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //after view did load, launch extra setting
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - table view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.snacks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = self.snacks[indexPath.row];
    if (self.selectedSnack == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != self.selectedSnack) {
        if (self.selectedSnack != NSNotFound) {
            NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.selectedSnack inSection:0];
            UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
            oldCell.accessoryType = UITableViewCellAccessoryNone;
        }
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedSnack = indexPath.row;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
