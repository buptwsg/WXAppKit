//
//  UINavigationBar+WXNavigationBarExt.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/11/19.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UINavigationBar+WXNavigationBarExt.h"
#import "WXRuntimeHelper.h"

@implementation UINavigationBar (WXNavigationBarExt)

+ (void)load {
    if (@available(iOS 11.0, *)) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            swizzleInstanceMethod(self, @selector(layoutSubviews), @selector(wx_layoutSubviews));
        });
    }
}

- (void)wx_layoutSubviews {
    [self wx_layoutSubviews];
    
    for (UIView *view in self.subviews) {
        for (UIView *stackView in view.subviews) {
            if (@available(iOS 9.0, *)) {
                if ([stackView isKindOfClass: [UIStackView class]]) {
                    stackView.superview.layoutMargins = UIEdgeInsetsMake(0, 8, 0, 8);
                    break;
                }
            }
        }
    }
}

- (void)wx_setBarColor:(UIColor *)color {
    
}
@end
