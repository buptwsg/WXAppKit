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

@property (class, strong, nonatomic) UIColor *normalTextColor;
@property (class, strong, nonatomic) UIColor *selectedTextColor;

@property (weak, nonatomic) id<WXMiddleButtonTabBarDelegate> wxDelegate;

@property (strong, nonatomic, readonly) NSArray<UIButton*> *buttonsArray;
@property (strong, nonatomic, readonly) NSArray<UILabel*> *labelsArray;

- (void)setMiddleButton: (UIButton*)button atCenterY: (CGFloat)centerY;

@end
