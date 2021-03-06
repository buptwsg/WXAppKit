//
//  WXNavigationController.m
//  WXAppKit
//
//  Created by sulirong on 2017/10/24.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "WXNavigationController.h"
#import "WXNavigationBar.h"

@interface WXNavigationController ()

@end

@implementation WXNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.topViewController) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController: viewController animated: YES];
    self.interactivePopGestureRecognizer.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WXNavigationBar *navigationBar = [[WXNavigationBar alloc] initWithFrame: CGRectZero];
    navigationBar.borderMarginForBarItem = 8;
    [self setValue: navigationBar forKey: @"navigationBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
