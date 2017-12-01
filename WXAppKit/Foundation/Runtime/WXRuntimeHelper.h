//
//  WXRuntimeHelper.h
//  WXAppKit
//
//  Created by sulirong on 2017/12/1.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL objectOverridesSelector(id object, SEL selector);

BOOL classOverridesSelectorOfBaseClass(Class subclass, Class baseClass, SEL selector);

void swizzleInstanceMethod(Class cls, SEL originSelector, SEL swizzledSelector);

void swizzleClassMethod(Class cls, SEL originSelector, SEL swizzledSelector);

