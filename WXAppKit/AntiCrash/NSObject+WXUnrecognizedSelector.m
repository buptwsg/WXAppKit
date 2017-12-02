//
//  NSObject+WXUnrecognizedSelector.m
//  WXAppKit
//
//  Created by sulirong on 2017/12/2.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSObject+WXUnrecognizedSelector.h"
#import "WXRuntimeHelper.h"

@implementation NSObject (WXUnrecognizedSelector)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleInstanceMethod(self, @selector(forwardingTargetForSelector:), @selector(wx_forwardingTargetForSelector:));
    });
}

- (id)wx_forwardingTargetForSelector: (SEL)selector {
    if (objectOverridesSelector(self, @selector(forwardingTargetForSelector:))) {
        return [self wx_forwardingTargetForSelector: selector];
    }
    else {
        //add method to a dynamic target, and forward to it.
    }
    
    return nil;
}
@end
