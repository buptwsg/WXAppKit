//
//  NSDictionary+WXLogUnicodeSupport.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSDictionary+WXLogUnicodeSupport.h"

@implementation NSDictionary (WXLogUnicodeSupport)

/**
 当数组中的内容包含Unicode字符，如中文时，如果po或者是使用NSLog打印，看到的是Unicode编码值，很不友好。覆写下面的方法，可以解决此问题。
 */

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *descString = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString: @""];
    for (int i = 0; i < level; i++) {
        [tab appendString: @"\t"];
    }
    [descString appendString: @"{\n"];
    NSArray *allKey = self.allKeys;
    for (int i = 0; i < allKey.count; i++) {
        id value = self[allKey[i]];
        NSString *lastSymbol = (allKey.count == i + 1) ? @"" : @";";
        if ([value respondsToSelector: @selector(descriptionWithLocale:indent:)]) {
            [descString appendFormat: @"\t%@%@ = %@%@\n", tab, allKey[i], [value descriptionWithLocale:locale indent: level + 1], lastSymbol];
        } else {
            [descString appendFormat: @"\t%@%@ = %@%@\n", tab, allKey[i], value, lastSymbol];
        }
    }
    [descString appendFormat: @"%@}", tab];
    return descString;
}

@end
