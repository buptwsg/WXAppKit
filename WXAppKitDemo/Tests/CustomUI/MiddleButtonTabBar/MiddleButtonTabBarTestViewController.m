//
//  MiddleButtonTabBarTestViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/27.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "MiddleButtonTabBarTestViewController.h"

@interface MiddleButtonTabBarTestViewController () <WXMiddleButtonTabBarDelegate>

@end

@implementation MiddleButtonTabBarTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.middleButtonTabBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarMiddleButtonDidSelected:(WXMiddleButtonTabBar *)tabBar {
    
}

- (void)tabBarMmiddleButtonDidLongPressed:(WXMiddleButtonTabBar *)tabBar {
    
}

@end
