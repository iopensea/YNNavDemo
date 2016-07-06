//
//  YNDisclosureButtonViewController.h
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNSecondLevelViewController.h"
@class YNDisclosureDetailViewController;

@interface YNDisclosureButtonViewController : YNSecondLevelViewController

@property (copy, nonatomic) NSArray *movies;
@property (strong, nonatomic) YNDisclosureDetailViewController *detailController;

@end
