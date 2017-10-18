//
//  ExtentionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "ExtentionsTestViewController.h"
#import "NSArrayExtentionsTestViewController.h"
#import "NSDictionaryExtentionsTestViewController.h"

@interface ExtentionsTestViewController ()

@property (nonatomic, strong) NSArray<NSString*> *extensionList;

@end

@implementation ExtentionsTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Extentions Test";
    self.extensionList = @[@"NSArray", @"NSDictionary"];
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
    switch (indexPath.row) {
        case 0: {
            UIViewController *vc = [[NSArrayExtentionsTestViewController alloc] init];
            [self.navigationController pushViewController: vc animated: YES];
            break;
        }
            
        case 1: {
            UIViewController *vc = [[NSDictionaryExtentionsTestViewController alloc] init];
            [self.navigationController pushViewController: vc animated: YES];
            break;
        }
            
        default:
            break;
    }
}

@end
