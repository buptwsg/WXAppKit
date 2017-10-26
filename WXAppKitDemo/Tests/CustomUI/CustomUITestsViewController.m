//
//  CustomUITestsViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/27.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "CustomUITestsViewController.h"

@interface CustomUITestsViewController ()

@property (nonatomic, strong) NSArray<NSString*> *customUIList;
@property (nonatomic, strong) NSArray<Class> *testClasses;

@end

@implementation CustomUITestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Extentions Test";
    self.customUIList = @[@"Middle Button TabBar"];
    self.testClasses = @[
                         ];
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customUIList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    cell.textLabel.text = self.customUIList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    UIViewController *vc = [[self.testClasses[indexPath.row] alloc] init];
    [self.navigationController pushViewController: vc animated: YES];
}

@end
