//
//  YNDisclosureButtonViewController.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNDisclosureButtonViewController.h"
#import "YNDisclosureDetailViewController.h"

static NSString *CellIdentifier = @"YNDisclosureButonCell";

@implementation YNDisclosureButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Disclosure Buttons";
        self.rowImage = [UIImage imageNamed:@"cell_tag_video_hd"];
        self.movies = @[@"Toy Story", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"12", @"...1"];
        self.detailController = [[YNDisclosureDetailViewController alloc]init];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        self.title = @"Disclosure Buttons";
        self.rowImage = [UIImage imageNamed:@"cell_tag_video_hd"];
        self.movies = @[@"Toy Story", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"12", @"13", @"15", @"16", @"17", @"18", @"19", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"...", @"..."];
        self.detailController = [[YNDisclosureDetailViewController alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //after view did load
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = self.movies[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Attention" message:@"Hey, do you see the disclosure button?" preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
//    [alertVc addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //action
//    }]];
    [self presentViewController:alertVc animated:YES completion:nil];

}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    self.detailController.title = @"Disclosure Button Pressed";
    NSString *selectedMovie = self.movies[indexPath.row];
    NSString *detailMessage = [[NSString alloc]initWithFormat:@"This is details for %@.",selectedMovie];
    self.detailController.message = detailMessage;
    self.detailController.title = selectedMovie;
    [self.navigationController pushViewController:self.detailController animated:YES];
}

@end
