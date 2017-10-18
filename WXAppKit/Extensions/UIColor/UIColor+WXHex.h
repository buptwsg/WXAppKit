//
//  UIColor+WXHex.h
//  WXAppKit
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 提供从16进制的数字/字符串，构造UIColor的帮助函数。
 */

@interface UIColor (WXHex)

+ (UIColor*)wx_colorWithHexNumber: (NSInteger)hex;

+ (UIColor*)wx_colorWithHexNumber: (NSInteger)hex alpha: (CGFloat)alpha;

+ (UIColor*)wx_colorWithHexString: (NSString*)hexString;

+ (UIColor*)wx_colorWithHexString: (NSString*)hexString alpha: (CGFloat)alpha;

@end
