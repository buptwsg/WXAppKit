//
//  NSObject+WXUnrecognizedSelector.m
//  WXAppKit
//
//  Created by sulirong on 2017/12/2.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+WXUnrecognizedSelector.h"
#import "WXRuntimeHelper.h"

/**
 The generic IMP function, it has variable number of parameters
 @param target trarget
 @param cmd cmd
 @param ... variable number of parameters
 @return default Implement return 0, like nil.
 */
static int smartFunction(id target, SEL cmd, ...) {
//    NSLog(@"smart IMP function is called, I have captured a crash");
    return 0;
}

static BOOL __addMethod(Class cls, SEL sel) {
    NSString *selName = NSStringFromSelector(sel);
    NSMutableString *tmpString = [selName mutableCopy];
    
    NSUInteger count = [tmpString replaceOccurrencesOfString: @":"
                                                  withString: @"_"
                                                     options: NSCaseInsensitiveSearch
                                                       range: NSMakeRange(0, selName.length)];
    
    NSMutableString *val = [[NSMutableString alloc] initWithString: @"i@:"];
    for (NSUInteger i = 0; i < count; i++) {
        [val appendString: @"@"];
    }
    const char *funcTypeEncoding = [val UTF8String];
    return class_addMethod(cls, sel, (IMP)smartFunction, funcTypeEncoding);
}

@interface WXUnrecognizedSelectorStubObject : NSObject
@end

@implementation WXUnrecognizedSelectorStubObject

+ (instancetype)shareInstance {
    static WXUnrecognizedSelectorStubObject *singleton;
    if (!singleton) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            singleton = [WXUnrecognizedSelectorStubObject new];
        });
    }
    return singleton;
}

- (BOOL)addFunc:(SEL)sel {
    return __addMethod([self class], sel);
}

+ (BOOL)addClassFunc:(SEL)sel {
    Class metaClass = objc_getMetaClass(class_getName(self));
    return __addMethod(metaClass, sel);
}

@end

@implementation NSObject (WXUnrecognizedSelector)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleInstanceMethod(self, @selector(forwardingTargetForSelector:), @selector(wx_forwardingTargetForSelector:));
    });
}

- (id)wx_forwardingTargetForSelector: (SEL)selector {
    //in DEBUG build, we should do nothing
#ifdef DEBUG
    return [self wx_forwardingTargetForSelector: selector];
#elif
    //check if the class overrides method -forwardInvocation:, if YES, we should call original method
    if (objectOverridesSelector(self, @selector(forwardInvocation:))) {
        return [self wx_forwardingTargetForSelector: selector];
    }
    else {
        //add method to a dynamic target, and forward to it.
        [[WXUnrecognizedSelectorStubObject shareInstance] addFunc: selector];
        return [WXUnrecognizedSelectorStubObject shareInstance];
    }
#endif
}

+ (id)forwardingTargetForSelector: (SEL)selector {
//    NSArray *stack = [NSThread callStackSymbols];
//    NSLog(@"call stack is %@", stack);
    [WXUnrecognizedSelectorStubObject addClassFunc: selector];
    return [WXUnrecognizedSelectorStubObject class];
}
@end
