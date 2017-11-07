//
//  ExtentionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "ExtentionsTestViewController.h"
#import "NSArrayExtensionsTestViewController.h"
#import "NSDictionaryExtensionsTestViewController.h"
#import "UIDeviceExtensionsTestViewController.h"
#import "UIColorExtensionsTestViewController.h"
#import "UIViewExtensionsTestViewController.h"
#import "NSAttributedStringExtensionsTestViewController.h"
#import "NSStringExtensionsTestViewController.h"
#import "NSObjectExtensionsTestViewController.h"

@interface ExtentionsTestViewController ()

@property (nonatomic, strong) NSArray<NSString*> *extensionList;
@property (nonatomic, strong) NSArray<Class> *testClasses;

@end

@implementation ExtentionsTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Extentions Test";
    self.extensionList = @[@"NSArray", @"NSDictionary", @"UIDevice", @"UIColor", @"UIView", @"NSAttributedString", @"NSString", @"NSObject"];
    self.testClasses = @[
                         [NSArrayExtensionsTestViewController class],
                         [NSDictionaryExtensionsTestViewController class],
                         [UIDeviceExtensionsTestViewController class],
                         [UIColorExtensionsTestViewController class],
                         [UIViewExtensionsTestViewController class],
                         [NSAttributedStringExtensionsTestViewController class],
                         [NSStringExtensionsTestViewController class],
                         [NSObjectExtensionsTestViewController class]
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
    return self.extensionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    cell.textLabel.text = self.extensionList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    UIViewController *vc = [[self.testClasses[indexPath.row] alloc] init];
    [self.navigationController pushViewController: vc animated: YES];
}

@end
