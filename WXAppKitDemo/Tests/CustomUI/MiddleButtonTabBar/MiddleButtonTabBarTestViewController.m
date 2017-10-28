//
//  MiddleButtonTabBarTestViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/27.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "MiddleButtonTabBarTestViewController.h"
#import "UIView+WXHelper.h"

@interface MiddleButtonTabBarTestViewController () <WXMiddleButtonTabBarDelegate>

@end

@implementation MiddleButtonTabBarTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.middleButtonTabBar.wxDelegate = self;
    UIButton *middleButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [middleButton setImage: [UIImage imageNamed: @"post_normal"] forState: UIControlStateNormal];
    [self.middleButtonTabBar setMiddleButton: middleButton atCenterY: self.middleButtonTabBar.height / 2 - 10];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"长按中间按钮退出页面";
    label.width = 200; label.height = 100;
    label.center = self.view.center;
    [self.view addSubview: label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarMiddleButtonDidSelected:(WXMiddleButtonTabBar *)tabBar {
    NSLog(@"tabbar middle button did selected");
}

- (void)tabBarMmiddleButtonDidLongPressed:(WXMiddleButtonTabBar *)tabBar {
    NSLog(@"tabbar middle button did long pressed");
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end
