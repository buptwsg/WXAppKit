//
//  UIColor+WXHex.m
//  WXAppKit
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UIColor+WXHex.h"

@implementation UIColor (WXHex)

+ (UIColor*)wx_colorWithHexNumber:(NSInteger)hex {
    return [self wx_colorWithHexNumber: hex alpha: 1];
}

+ (UIColor*)wx_colorWithHexNumber:(NSInteger)hex alpha:(CGFloat)alpha {
    unsigned r, g, b;
    r = (hex & 0xff0000) >> 16;
    g = (hex & 0x00ff00) >> 8;
    b = hex & 0x0000ff;
    return [UIColor colorWithRed: 1.0*r/255 green: 1.0*g/255 blue: 1.0*b/255 alpha: alpha];
}

+ (UIColor*)wx_colorWithHexString:(NSString *)hexString {
    return [self wx_colorWithHexString: hexString alpha: 1];
}

+ (UIColor*)wx_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    // String should be 6 or 7 characters if it includes '#'
    if (hexString.length != 6 && hexString.length != 7)
        return ([UIColor redColor]);
    
    NSInteger startIndex = 0;
    if (hexString.length == 7) {
        startIndex = 1;
    }
    
    NSString *strR = [hexString substringWithRange: NSMakeRange(startIndex, 2)];
    NSString *strG = [hexString substringWithRange: NSMakeRange(2 + startIndex, 2)];
    NSString *strB = [hexString substringWithRange: NSMakeRange(4 + startIndex, 2)];
    
    // Scan values
    unsigned r, g, b;
    [[NSScanner scannerWithString: strR] scanHexInt: &r];
    [[NSScanner scannerWithString: strG] scanHexInt: &g];
    [[NSScanner scannerWithString: strB] scanHexInt: &b];
    
    return [UIColor colorWithRed: ((float) r / 255.0f)
                           green: ((float) g / 255.0f)
                            blue: ((float) b / 255.0f)
                           alpha: alpha];
}

@end
