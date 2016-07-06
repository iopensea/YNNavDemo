//
//  YNDisclosureDetailViewController.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNDisclosureDetailViewController.h"

@implementation YNDisclosureDetailViewController

//property's get method
- (UILabel *)label {
    //return self.view as UILabel !!!
    return (id)self.view;
}

//customize view method
- (void)loadView {
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    //set label to self.view, which is UILable !!!
    self.view = label;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.text = self.message;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
