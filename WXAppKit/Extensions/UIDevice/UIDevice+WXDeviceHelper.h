//
//  UIDevice+WXDeviceHelper.h
//  WXAppKit
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (WXDeviceHelper)

+ (BOOL)wx_isIphone;

+ (BOOL)wx_isIpad;

+ (BOOL)wx_isSimulator;

+ (NSString *)wx_platformDescription;

@end
