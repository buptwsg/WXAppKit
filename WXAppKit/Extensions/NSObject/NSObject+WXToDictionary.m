//
//  NSObject+WXToDictionary.m
//  WXAppKit
//
//  Created by sulirong on 2017/11/8.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+WXToDictionary.h"

@implementation NSObject (WXToDictionary)

- (nonnull NSDictionary*)wx_dictionary {
    NSMutableArray *keysArray = [NSMutableArray array];
    unsigned int propertyCount = 0;
    Class subclass = [self class];
    while (subclass != [NSObject class]) {
        objc_property_t *properties = class_copyPropertyList(subclass, &propertyCount);
        for (unsigned int i = 0; i < propertyCount; i++) {
            const char *propertyName = property_getName(properties[i]);
            NSString *key = @(propertyName);
            [keysArray addObject: key];
        }
        free(properties);
        subclass = [subclass superclass];
    }
    
    return [self dictionaryWithValuesForKeys: keysArray];
}

- (nonnull NSString*)wx_description {
    return [NSString stringWithFormat: @"<%@: %p> -- %@", [self class], self, self.wx_dictionary];
}

@end
