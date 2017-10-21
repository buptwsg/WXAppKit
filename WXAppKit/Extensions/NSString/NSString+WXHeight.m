//
//  NSString+WXHeight.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/21.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/NSStringDrawing.h>
#import "NSString+WXHeight.h"

@implementation NSString (WXHeight)

- (CGFloat)wx_heightThatFitWidth: (CGFloat)width andFont: (UIFont*)font {
    NSParameterAssert(font != nil);
    NSDictionary *options = @{NSFontAttributeName : font};
    CGRect rect = [self boundingRectWithSize: CGSizeMake(width, CGFLOAT_MAX) options: NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes: options context: NULL];
    return ceilf(rect.size.height);
}
@end
