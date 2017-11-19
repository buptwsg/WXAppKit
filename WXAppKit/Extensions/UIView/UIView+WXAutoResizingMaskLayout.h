//
//  UIView+WXAutoResizingMaskLayout.h
//  WXAppKit
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView * (^WXUIViewSnapBorderBlock)(CGFloat margin);
typedef UIView * (^WXUIViewFlexibleWHBlock)(CGFloat margin1, CGFloat margin2);
typedef UIView * (^WXUIViewFillWithEdgesBlock)(UIEdgeInsets insets);

@interface UIView (WXAutoResizingMaskLayout)

- (WXUIViewSnapBorderBlock)snapLeft;

- (WXUIViewSnapBorderBlock)snapTop;

- (WXUIViewSnapBorderBlock)snapRight;

- (WXUIViewSnapBorderBlock)snapBottom;

- (UIView*)snapHCenter;

- (UIView*)snapVCenter;

- (WXUIViewFlexibleWHBlock)flexibleWidth;

- (WXUIViewFlexibleWHBlock)flexibleHeight;

- (WXUIViewFillWithEdgesBlock)fillSuperViewWithEdges;

- (void)centerInSuperView;

- (UIView*)and;

@end
