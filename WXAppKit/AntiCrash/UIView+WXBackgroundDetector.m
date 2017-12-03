//
//  UIView+WXBackgroundDetector.m
//  PerformanceTest
//
//  Created by Shuguang Wang on 2017/11/29.
//  Copyright © 2017年 Shuguang Wang. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+WXBackgroundDetector.h"

@implementation UIView (WXBackgroundDetector)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method origin = class_getInstanceMethod(self, @selector(setNeedsLayout));
        Method hooked = class_getInstanceMethod(self, @selector(wx_setNeedsLayout));
        method_exchangeImplementations(origin, hooked);
        
        origin = class_getInstanceMethod(self, @selector(setNeedsDisplay));
        hooked = class_getInstanceMethod(self, @selector(wx_setNeedsDisplay));
        method_exchangeImplementations(origin, hooked);
        
        origin = class_getInstanceMethod(self, @selector(setNeedsDisplayInRect:));
        hooked = class_getInstanceMethod(self, @selector(wx_setNeedsDisplayInRect:));
        method_exchangeImplementations(origin, hooked);
    });
}

- (void)wx_setNeedsLayout {
    [self wx_setNeedsLayout];
    NSAssert([NSThread isMainThread], @"setNeedsLayout: update UI in background thread is detected!");
}

- (void)wx_setNeedsDisplay {
    [self wx_setNeedsDisplay];
    NSAssert([NSThread isMainThread], @"setNeedsDisplay: update UI in background thread is detected!");
}

- (void)wx_setNeedsDisplayInRect: (CGRect)rect {
    [self wx_setNeedsDisplayInRect: rect];
    NSAssert([NSThread isMainThread], @"setNeedsDisplayInRect: update UI in background thread is detected!");
}

@end
