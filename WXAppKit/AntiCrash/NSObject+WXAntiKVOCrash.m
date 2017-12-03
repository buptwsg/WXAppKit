//
//  NSObject+WXAntiKVOCrash.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/12/3.
//  Copyright © 2017年 buptwsg. All rights reserved.
//
#import <objc/runtime.h>
#import "NSObject+WXAntiKVOCrash.h"
#import "WXRuntimeHelper.h"

#pragma mark - WXKVOWeakObject
/**
 The instance of this class holds a weak reference to observer
 */
@interface WXKVOWeakObject : NSObject

@property (weak, nonatomic) NSObject *observer;

@end

@implementation WXKVOWeakObject
@end

#pragma mark - WXKVOProxy
/**
 KVO Proxy class, instance of this class is registered as observer, and is responsible for forwarding to real observer
 */
@interface WXKVOProxy : NSObject

/**
 the object that is observe[d
 */
@property (unsafe_unretained, nonatomic) NSObject *observed;

/**
 keyPath to observers map
 */
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSMutableArray<WXKVOWeakObject *> *> *keyPathObserverMap;

@end

@implementation WXKVOProxy
- (void)dealloc {
    for (NSString *keyPath in self.keyPathObserverMap) {
        [self.observed wx_removeObserver: self forKeyPath: keyPath];
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _keyPathObserverMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSMutableArray<WXKVOWeakObject*> *observers = self.keyPathObserverMap[keyPath];
    NSArray *copiedObservers = [observers copy];
    for (WXKVOWeakObject *weakObj in copiedObservers) {
        if (weakObj.observer == nil) {
            [observers removeObject: weakObj];
        }
        else {
            [weakObj.observer observeValueForKeyPath: keyPath ofObject: object change: change context: context];
        }
    }
}

@end

#pragma mark - WXAntiKVOCrash

static void *WXAntiKVOCrashContext = &WXAntiKVOCrashContext;

@implementation NSObject (WXAntiKVOCrash)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleInstanceMethod(self, @selector(addObserver:forKeyPath:options:context:), @selector(wx_addObserver:forKeyPath:options:context:));
        swizzleInstanceMethod(self, @selector(removeObserver:forKeyPath:), @selector(wx_removeObserver:forKeyPath:));
    });
}

- (void)wx_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    NSMutableDictionary *map = [self.kvoProxy keyPathObserverMap];
    if (!map[keyPath]){
        //this keyPath is not observed yet
        WXKVOWeakObject *weakObject = [[WXKVOWeakObject alloc] init];
        weakObject.observer = observer;
        map[keyPath] = [@[weakObject] mutableCopy];
        
        //这么做其实是有一个缺陷：context没有被利用，只有第一个调用addObserver:方法的context被使用了。
        [self wx_addObserver: self.kvoProxy forKeyPath: keyPath options: options context: context];
    }
    else {
        NSMutableArray *observers = map[keyPath];
        //check if observer is already added
        BOOL exists = NO;
        for (WXKVOWeakObject *weakObject in observers) {
            if (weakObject.observer == observer) {
                exists = YES;
                break;
            }
        }
        
        if (exists) {
            NSString *errorMsg = [NSString stringWithFormat: @"%@ is already added as observer of %@ for keyPath: %@", observer, self, keyPath];
            NSAssert(NO, errorMsg);
        }
        else {
            WXKVOWeakObject *weakObject = [[WXKVOWeakObject alloc] init];
            weakObject.observer = observer;
            [observers addObject: weakObject];
        }
    }
}

- (void)wx_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    NSMutableDictionary *map = [self.kvoProxy keyPathObserverMap];
    if (!map[keyPath]) {
        NSString *errorMsg = [NSString stringWithFormat: @"%@ is not added as observer of %@ for keyPath: %@", observer, self, keyPath];
        NSAssert(NO, errorMsg);
    }
    else {
        NSMutableArray *observers = map[keyPath];
        NSArray *copiedObservers = [observers copy];
        [copiedObservers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WXKVOWeakObject *weakObj = (WXKVOWeakObject*)obj;
            if (weakObj.observer == observer || weakObj.observer == nil) {
                [observers removeObject: obj];
            }
        }];
        
        if (observers.count == 0) {
            [self wx_removeObserver: self.kvoProxy forKeyPath: keyPath];
            [map removeObjectForKey: keyPath];
        }
    }
}

- (WXKVOProxy*)kvoProxy {
    WXKVOProxy *proxy = objc_getAssociatedObject(self, WXAntiKVOCrashContext);
    if (!proxy) {
        proxy = [[WXKVOProxy alloc] init];
        proxy.observed = self;
        objc_setAssociatedObject(self, WXAntiKVOCrashContext, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return proxy;
}

@end
