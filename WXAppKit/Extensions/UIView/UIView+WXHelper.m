//
//  UIView+WXHelper.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/19.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UIView+WXHelper.h"

@implementation UIView (WXHelper)

- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.frame);
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)scaleX {
    CGAffineTransform transform = self.transform;
    return 0;
}

- (void)setScaleX:(CGFloat)scaleX {
    self.transform = CGAffineTransformMakeScale(scaleX, 1);
}

- (CGFloat)scaleY {
    CGAffineTransform transform = self.transform;
    return 0;
}

- (void)setScaleY:(CGFloat)scaleY {
    self.transform = CGAffineTransformMakeScale(1, scaleY);
}

- (CGPoint)scale {
    return CGPointMake(1, 1);
}

- (void)setScale:(CGPoint)scale {
    self.transform = CGAffineTransformMakeScale(scale.x, scale.y);
}

- (CGFloat)rotation {
    return 0;
}

- (void)setRotation:(CGFloat)rotation {
    self.transform = CGAffineTransformMakeRotation(rotation / 180 * M_PI);
}

- (nullable UIViewController*)wx_viewController {
    for (UIView *view = self; view; view = self.superview) {
        UIResponder *responder = [view nextResponder];
        if ([responder isKindOfClass: [UIViewController class]]) {
            return (UIViewController*)responder;
        }
    }
    
    //A view may be added to UIWindow, in this case, it has no associated view controller
    return nil;
}
@end
