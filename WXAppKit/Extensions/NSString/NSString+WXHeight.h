//
//  NSString+WXHeight.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/21.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIFont;

@interface NSString (WXHeight)

- (CGFloat)wx_heightThatFitWidth: (CGFloat)width andFont: (UIFont*)font;

@end
