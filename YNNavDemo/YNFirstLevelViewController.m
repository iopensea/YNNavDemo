//
//  YNFirstLevelViewController.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNFirstLevelViewController.h"
#import "YNSecondLevelViewController.h"
#import "YNDisclosureButtonViewController.h"
#import "YNCheckListViewController.h"
#import "YNRowControlsViewController.h"
#import "YNMoveMeViewController.h"
#import "YNDeleteMeViewController.h"

static NSString *CellIdentifier = @"YNCell";

@implementation YNFirstLevelViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        //initialize
        self.title = @"First level";
        self.controllers = @[[[YNDisclosureButtonViewController alloc]init],
                             [[YNCheckListViewController alloc]init],
                             [[YNRowControlsViewController alloc]init],
                             [[YNMoveMeViewController alloc]init],
                             [[YNDeleteMeViewController alloc]init]
                             ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //configure cell
    YNSecondLevelViewController *second = self.controllers[indexPath.row];
    cell.textLabel.text = second.title;
    cell.imageView.image = second.rowImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YNSecondLevelViewController *second = self.controllers[indexPath.row];
    [self.navigationController pushViewController:second animated:YES];
}

#pragma mark - memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
