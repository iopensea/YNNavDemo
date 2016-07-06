//
//  YNRowControlsViewController.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNRowControlsViewController.h"

static NSString *CellIdentifier = @"Cell";
static NSInteger BaseTag = 10000;

@implementation YNRowControlsViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Row Controls";
        self.rowImage = [UIImage imageNamed:@"audionews_download_icon"];
        self.characters = @[@"R2-D2", @"C3PO", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblab", @"Bender", @"Marvin", @"Lt.Commander Data", @"Evil Brother Lore", @"Optimus Prive", @"Tobor", @"HAL", @"Orgasmatron", @"...3"];
    }
    return self;
}

- (void)tappedButton:(UIButton *)sender {
    NSInteger row = sender.tag - BaseTag;
    NSString *character = self.characters[row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You tapped the button" message:[NSString stringWithFormat:@"You tapped the button for %@", character] preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //action
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - table view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = self.characters[indexPath.row];
    if (cell.accessoryView == nil) {
        UIImage *buttonUpImage = [UIImage imageNamed:@"contenttoolbar_hd_close"];
        UIImage *buttonDownImage = [UIImage imageNamed:@"contenttoolbar_hd_comment"];
        [buttonDownImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [buttonUpImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:buttonDownImage forState:UIControlStateNormal];
        [button setBackgroundImage:buttonUpImage forState:UIControlStateHighlighted];
        [button setTitle:@"Tap" forState:UIControlStateNormal];
        [button sizeToFit];
        [button addTarget:self action:@selector(tappedButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = button;
    }
    cell.accessoryView.tag = indexPath.row + BaseTag;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *character = self.characters[indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You tapped the row." message:[NSString stringWithFormat:@"You tapped %@", character] preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //action
    }]];
    [self presentViewController:alert animated:YES completion:nil];

    dispatch_after(3, dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });

}

@end
