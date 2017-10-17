//
//  NSArray+WXLogUnicodeSupport.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSArray+WXLogUnicodeSupport.h"

@implementation NSArray (WXLogUnicodeSupport)

- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    NSMutableString *descString = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString: @""];
    for (int i = 0; i < level; i++) {
        [tab appendString: @"\t"];
    }
    [descString appendString: @"(\n"];
    for (int i = 0; i < self.count; i++) {
        NSString *lastSymbol = (self.count == i + 1) ? @"" : @",";
        id value = self[i];
        if ([value respondsToSelector: @selector(descriptionWithLocale:indent:)]) {
            [descString appendFormat: @"\t%@%@%@\n", tab, [value descriptionWithLocale:locale indent:level + 1], lastSymbol];
        }
        else {
            [descString appendFormat: @"\t%@%@%@\n", tab, value, lastSymbol];
        }
    }
    [descString appendFormat: @"%@)",tab];
    return descString;
}

@end
