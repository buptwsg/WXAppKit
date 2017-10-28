//
//  CustomUITestsViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/27.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "CustomUITestsViewController.h"
#import "MiddleButtonTabBarTestViewController.h"
#import "WXTextFieldTestViewController.h"

@interface CustomUITestsViewController ()

@property (nonatomic, strong) NSArray<NSString*> *customUIList;
@property (nonatomic, strong) NSArray<Class> *testClasses;

@end

@implementation CustomUITestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Extentions Test";
    self.customUIList = @[@"Middle Button TabBar", @"Text Field with Max Length"];
    self.testClasses = @[[NSNull null],
                         [WXTextFieldTestViewController class]
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
    if (0 == indexPath.row) {
        WXMiddleButtonTabBar.normalTextColor = [UIColor grayColor];
        WXMiddleButtonTabBar.selectedTextColor = [UIColor darkGrayColor];
        MiddleButtonTabBarTestViewController *vc = [[MiddleButtonTabBarTestViewController alloc] init];
        
        UIViewController *vc1 = [[UIViewController alloc] init];
        vc1.view.backgroundColor = [UIColor redColor];
        [vc addChildViewController: vc1 title: @"热门" image: @"home_normal" selectedImage: @"home_highlight"];
        
        UIViewController *vc2 = [[UIViewController alloc] init];
        vc2.view.backgroundColor = [UIColor greenColor];
        [vc addChildViewController: vc2 title: @"消息" image: @"message_normal" selectedImage: @"message_highlight"];
        
        UIViewController *vc3 = [[UIViewController alloc] init];
        vc3.view.backgroundColor = [UIColor blueColor];
        [vc addChildViewController: vc3 title: @"同城" image: @"mycity_normal" selectedImage: @"mycity_highlight"];
        
        UIViewController *vc4 = [[UIViewController alloc] init];
        vc4.view.backgroundColor = [UIColor orangeColor];
        [vc addChildViewController: vc4 title: @"我的" image: @"tabbar_profile" selectedImage: @"tabbar_profile_selected"];
        [self.navigationController presentViewController: vc animated: YES completion: nil];
    }
    else {
        UIViewController *vc = [[self.testClasses[indexPath.row] alloc] init];
        [self.navigationController pushViewController: vc animated: YES];
    }
}

@end
