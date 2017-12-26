//
//  CALayer+WXBorderUIColor.m
//  WXAppKit
//
//  Created by sulirong on 2017/12/26.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "CALayer+WXBorderUIColor.h"

@implementation CALayer (WXBorderUIColor)

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor: self.borderColor];
}

@end
