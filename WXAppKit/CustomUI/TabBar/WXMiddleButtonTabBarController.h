//
//  WXMiddleButtonTabBarController.h
//  WXAppKit
//
//  Created by sulirong on 2017/10/23.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXMiddleButtonTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXMiddleButtonTabBarController : UITabBarController

@property (nonatomic, readonly) WXMiddleButtonTabBar *middleButtonTabBar;

- (void)addChildViewController:(nonnull UIViewController *)childController title: (nonnull NSString*)title image: (nonnull NSString*)imageName selectedImage: (nullable NSString*)selectedImageName;

@end

NS_ASSUME_NONNULL_END
