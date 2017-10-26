//
//  WXMiddleButtonTabBarController.m
//  WXAppKit
//
//  Created by sulirong on 2017/10/23.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "WXMiddleButtonTabBarController.h"
#import "WXNavigationController.h"

@interface WXMiddleButtonTabBarController ()

@end

@implementation WXMiddleButtonTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用KVC替换默认的TabBar
    WXMiddleButtonTabBar *myTabBar = [[WXMiddleButtonTabBar alloc] init];
    [self setValue: myTabBar forKey: @"tabBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    WXNavigationController *navVC = [[WXNavigationController alloc] initWithRootViewController: childController];
    childController.navigationItem.title = title;
    childController.tabBarItem.title = title;
    
    UIImage *normalImage = [UIImage imageNamed: imageName];
    normalImage = [normalImage imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.image = normalImage;
    
    if (selectedImageName) {
        UIImage *selectedImage = [UIImage imageNamed: selectedImageName];
        selectedImage = [selectedImage imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        childController.tabBarItem.selectedImage = selectedImage;
    }
    
    [self addChildViewController: navVC];
}

- (WXMiddleButtonTabBar*)middleButtonTabBar {
    return (WXMiddleButtonTabBar*)self.tabBar;
}

@end
