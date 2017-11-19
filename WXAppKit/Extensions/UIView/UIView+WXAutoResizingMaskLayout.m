//
//  UIView+WXAutoResizingMaskLayout.m
//  WXAppKit
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UIView+WXAutoResizingMaskLayout.h"
#import "UIView+WXHelper.h"

@implementation UIView (WXAutoResizingMaskLayout)

- (WXUIViewSnapBorderBlock)snapLeft {
    return ^UIView*(CGFloat border) {
        self.left = border;
        self.autoresizingMask |= UIViewAutoresizingFlexibleRightMargin;
        return self;
    };
}

- (WXUIViewSnapBorderBlock)snapTop {
    return ^UIView*(CGFloat border) {
        self.top = border;
        self.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
        return self;
    };
}

- (WXUIViewSnapBorderBlock)snapRight {
    return ^UIView*(CGFloat border) {
        self.right = self.superview.width - border;
        self.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin;
        return self;
    };
}

- (WXUIViewSnapBorderBlock)snapBottom {
    return ^UIView*(CGFloat border) {
        self.bottom = self.superview.height - border;
        self.autoresizingMask |= UIViewAutoresizingFlexibleTopMargin;
        return self;
    };
}

- (UIView*)snapHCenter {
    self.centerX = self.superview.width / 2;
    self.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    return self;
}

- (UIView*)snapVCenter {
    self.centerY = self.superview.height / 2;
    self.autoresizingMask |= UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    return self;
}

- (WXUIViewFlexibleWHBlock)flexibleWidth {
    return ^UIView*(CGFloat margin1, CGFloat margin2) {
        CGRect frame = self.frame;
        self.frame = CGRectMake(margin1, frame.origin.y, self.superview.width - margin1 - margin2, frame.size.height);
        self.autoresizingMask |= UIViewAutoresizingFlexibleWidth;
        return self;
    };
}

- (WXUIViewFlexibleWHBlock)flexibleHeight {
    return ^UIView*(CGFloat margin1, CGFloat margin2) {
        CGRect frame = self.frame;
        self.frame = CGRectMake(frame.origin.x, margin1, frame.size.width, self.superview.height - margin1 - margin2);
        self.autoresizingMask |= UIViewAutoresizingFlexibleHeight;
        return self;
    };
}

- (WXUIViewFillWithEdgesBlock)fillSuperViewWithEdges {
    return ^UIView*(UIEdgeInsets insets) {
        self.frame = CGRectMake(insets.left, insets.top, self.superview.width - insets.left - insets.right, self.superview.height - insets.top - insets.bottom);
        self.autoresizingMask |= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        return self;
    };
}

- (void)centerInSuperView {
    UIView *view = self.snapHCenter.snapVCenter;
    view = nil;
}

- (UIView*)and {
    return self;
}

@end
