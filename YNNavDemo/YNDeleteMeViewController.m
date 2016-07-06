//
//  YNDeleteMeViewController.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNDeleteMeViewController.h"

static NSString *CellIdentifier = @"Cell";

@implementation YNDeleteMeViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.title = @"Delete";
    self.rowImage = [UIImage imageNamed:@"contenttoolbar_hd_close"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"computers" ofType:@"plist"];
    self.computers = [[NSMutableArray alloc]initWithContentsOfFile:path];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - table data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = self.computers[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [self.computers removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
