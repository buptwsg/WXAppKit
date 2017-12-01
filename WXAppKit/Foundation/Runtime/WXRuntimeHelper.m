//
//  WXRuntimeHelper.m
//  WXAppKit
//
//  Created by sulirong on 2017/12/1.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <objc/runtime.h>
#import "WXRuntimeHelper.h"

BOOL objectOverridesSelector(id object, SEL selector) {
    Class objSuperClass = [object superclass];
    BOOL isMethodOverridden = NO;
    
    while (objSuperClass) {
        isMethodOverridden = [object methodForSelector: selector] != [objSuperClass instanceMethodForSelector: selector];
        if (isMethodOverridden) {
            break;
        }
        
        objSuperClass = [objSuperClass superclass];
    }
    
    return isMethodOverridden;
}

BOOL classOverridesSelectorOfBaseClass(Class subclass, Class baseClass, SEL selector) {
    IMP impSub = method_getImplementation(class_getInstanceMethod(subclass, selector));
    IMP impBase = method_getImplementation(class_getInstanceMethod(baseClass, selector));
    return impSub != impBase;
}

void swizzleInstanceMethod(Class cls, SEL originSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    if (class_addMethod(cls, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

void swizzleClassMethod(Class cls, SEL originSelector, SEL swizzledSelector) {
    Method originalMethod = class_getClassMethod(cls, originSelector);
    Method swizzledMethod = class_getClassMethod(cls, swizzledSelector);
    
    Class metaClass = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    
    if (class_addMethod(metaClass, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(metaClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
