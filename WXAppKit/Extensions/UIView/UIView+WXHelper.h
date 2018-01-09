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
 Instantiate a view from nib.
 */
+ (nullable instancetype)instantiateFromNib;

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
 Scale a view horizontally
 */
@property (nonatomic) CGFloat scaleX;

/**
 Scale a view vertically
 */
@property (nonatomic) CGFloat scaleY;

/**
 Scale a view both horizontally and vertically
 */
@property (nonatomic) CGPoint scale;

/**
 Rotate a view by degree
 */
@property (nonatomic) CGFloat rotation;

/**
 Judge whether UI orientation is portrait
 */
@property (nonatomic, readonly) BOOL isPortrait;

/**
 A handy method to get the view's view controller instance.
 */
@property (nullable, nonatomic, readonly) UIViewController *wx_viewController;

/**
 Different from viewWithTag:, this method will only search view with tag from subviews
 */
- (nullable UIView*)wx_subviewWithTag: (NSInteger)tag;

- (void)wx_prettyPrintSubviewHierarchy;

@end

NS_ASSUME_NONNULL_END
