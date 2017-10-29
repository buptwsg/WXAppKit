//
//  WXWeakProxy.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/29.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "WXWeakProxy.h"

@implementation WXWeakProxy

- (instancetype)initWithTarget: (id)target {
    _target = target;
    return self;
}

//类方法
+ (instancetype)proxyWithTarget: (id)target {
    return [[WXWeakProxy alloc] initWithTarget: target];
}

#pragma mark - private
- (id)forwardingTargetForSelector: (SEL)selector {
    return _target;
}

#pragma mark - <NSObject>
- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

@end
