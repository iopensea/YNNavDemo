//
//  YNRowControlsViewController.h
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNSecondLevelViewController.h"

@interface YNRowControlsViewController : YNSecondLevelViewController

@property (copy, nonatomic) NSArray *characters;

- (IBAction)tappedButton:(UIButton *)sender;

@end
