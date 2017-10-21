//
//  NSAttributedString+WXHeight.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/21.
//  Copyright © 2017年 buptwsg. All rights reserved.
//
#import <UIKit/NSStringDrawing.h>
#import "NSAttributedString+WXHeight.h"

@implementation NSAttributedString (WXHeight)

- (CGFloat)wx_heightThatFitWidth: (CGFloat)width {
    CGRect rect = [self boundingRectWithSize: CGSizeMake(width, CGFLOAT_MAX) options: NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context: NULL];
    return ceilf(rect.size.height);
}
@end
