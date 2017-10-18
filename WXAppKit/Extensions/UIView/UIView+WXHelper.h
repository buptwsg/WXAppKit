//
//  UIView+WXHelper.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/19.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WXHelper)

/**
 Shortcut for frame.origin.x
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat left;

/**
 Shortcut for frame.origin.y
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat top;

/**
 Shortcut for frame.origin.x + frame.size.width
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat right;

/**
 Shortcut for frame.origin.y + frame.size.height
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat bottom;

/**
 Shortcut for frame.size.width
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat width;

/**
 Shortcut for frame.size.height
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat height;

/**
 Shortcut for center.x
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat centerX;

/**
 Shortcut for center.y
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGFloat centerY;

/**
 Shortcut for frame.origin
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGPoint origin;

/**
 Shortcut for frame.size
 @Warning "wx_" prefix is not added
 */
@property (nonatomic) CGSize  size;

/**
 A handy method to get the view's view controller instance.
 */
@property (nullable, nonatomic, readonly) UIViewController *wx_viewController;

@end

NS_ASSUME_NONNULL_END

