//
//  WXMiddleButtonTabBar.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/22.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WXMiddleButtonTabBar;

@protocol WXMiddleButtonTabBarDelegate <NSObject>

@optional

- (void)tabBarMiddleButtonDidSelected: (WXMiddleButtonTabBar*)tabBar;
- (void)tabBarMmiddleButtonDidLongPressed: (WXMiddleButtonTabBar*)tabBar;

@end

@interface WXMiddleButtonTabBar : UITabBar

/**
 Text color for normal state
 @warning set text color before creating WXMiddleButtonTabBarController
 */
@property (class, strong, nonatomic) UIColor *normalTextColor;

/**
 Text color for selected state
 @warning set text color before creating WXMiddleButtonTabBarController
 */
@property (class, strong, nonatomic) UIColor *selectedTextColor;

@property (weak, nonatomic) id<WXMiddleButtonTabBarDelegate> wxDelegate;

/**
 This array contains the image views for each tab item
 */
@property (strong, nonatomic, readonly) NSArray<UIImageView*> *imageViewsArray;

/**
 This array contains the labels for each tab item
 */
@property (strong, nonatomic, readonly) NSArray<UILabel*> *labelsArray;

/**
 Set the middle button to WXMiddleButtonTabBar
 @param button the button view
 @param centerY the value for the button's center.y
 */
- (void)setMiddleButton: (UIButton*)button atCenterY: (CGFloat)centerY;

@end
