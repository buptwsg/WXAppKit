//
//  UIDevice+WXDeviceHelper.m
//  WXAppKit
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <sys/utsname.h>
#import "UIDevice+WXDeviceHelper.h"

@implementation UIDevice (WXDeviceHelper)

+ (BOOL)wx_isIphone {
    return [self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (BOOL)wx_isIpad {
    return [self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)wx_isSimulator {
#if TARGET_OS_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

+ (NSString*)wx_platformDescription {
    //see https://www.theiphonewiki.com/wiki/Models to get updated model list
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *rawMachine = [NSString stringWithCString: systemInfo.machine encoding: NSASCIIStringEncoding];
    NSDictionary *map = @{
                          //Simulator
                          @"i386" : @"32 bit simulator",
                          @"x86_64" : @"64 bit simulator",
                          
                          //iPhone
                          @"iPhone4,1" : @"iPhone 4s",
                          @"iPhone5,1" : @"iPhone 5",
                          @"iPhone5,2" : @"iPhone 5",
                          @"iPhone5,3" : @"iPhone 5c",
                          @"iPhone5,4" : @"iPhone 5c",
                          @"iPhone6,1" : @"iPhone 5s",
                          @"iPhone6,2" : @"iPHone 5s",
                          @"iPhone7,1" : @"iPhone 6 Plus",
                          @"iPhone7,2" : @"iPhone 6",
                          @"iPhone8,1" : @"iPhone 6s",
                          @"iPhone8,2" : @"iPhone 6s Plus",
                          @"iPhone8,4" : @"iPhone SE",
                          @"iPhone9,1" : @"iPhone 7",
                          @"iPhone9,3" : @"iPhone 7",
                          @"iPhone9,2" : @"iPhone 7 Plus",
                          @"iPhone9,4" : @"iPhone 7 Plus",
                          @"iPhone10,1" : @"iPhone 8",
                          @"iPhone10,4" : @"iPhone 8",
                          @"iPhone10,2" : @"iPhone 8 Plus",
                          @"iPhone10,5" : @"iPhone 8 Plus",
                          @"iPhone10,3" : @"iPhone X",
                          @"iPhone10,6" : @"iPhone X",
                          
                          //iPad 2
                          @"iPad2,1" : @"iPad 2",
                          @"iPad2,2" : @"iPad 2",
                          @"iPad2,3" : @"iPad 2",
                          @"iPad2,4" : @"iPad 2",
                          
                          //iPad Mini
                          @"iPad2,5" : @"iPad Mini",
                          @"iPad2,6" : @"iPad Mini",
                          @"iPad2,7" : @"iPad Mini",
                          
                          //iPad 3
                          @"iPad3,1" : @"iPad 3",
                          @"iPad3,2" : @"iPad 3",
                          @"iPad3,3" : @"iPad 3",
                          
                          //iPad 4
                          @"iPad3,4" : @"iPad 4",
                          @"iPad3,5" : @"iPad 4",
                          @"iPad3,6" : @"iPad 4",
                          
                          //iPad Air
                          @"iPad4,1" : @"iPad Air",
                          @"iPad4,2" : @"iPad Air",
                          @"iPad4,3" : @"iPad Air",
                          
                          //iPad Mini 2
                          @"iPad4,4" : @"iPad Mini 2",
                          @"iPad4,5" : @"iPad Mini 2",
                          @"iPad4,6" : @"iPad Mini 2",
                          
                          //iPad Mini 3
                          @"iPad4,7" : @"iPad Mini 3",
                          @"iPad4,8" : @"iPad Mini 3",
                          @"iPad4,9" : @"iPad Mini 3",
                          
                          //iPad Mini 4
                          @"iPad5,1" : @"iPad Mini 4",
                          @"iPad5,2" : @"iPad Mini 4",
                          
                          //iPad Air 2
                          @"iPad5,3" : @"iPad Air 2",
                          @"iPad5,4" : @"iPad Air 2",
                          
                          //iPad Pro 9.7
                          @"iPad6,3" : @"iPad Pro 9.7",
                          @"iPad6,4" : @"iPad Pro 9.7",
                          
                          //iPad Pro 12.9
                          @"iPad6,7" : @"iPad Pro 12.9",
                          @"iPad6,8" : @"iPad Pro 12.9",
                          
                          //iPad 9.7-Inch 5th Gen
                          @"iPad6,11" : @"iPad 9.7-Inch 5th Gen",
                          @"iPad6,12" : @"iPad 9.7-Inch 5th Gen",
                          
                          //iPad Pro 12.9, 2nd Gen
                          @"iPad7,1" : @"iPad Pro 12.9, 2nd Gen",
                          @"iPad7,2" : @"iPad Pro 12.9, 2nd Gen",
                          
                          //iPad Pro 10.5 Inch
                          @"iPad7,3" : @"iPad Pro 10.5",
                          @"iPad7,4" : @"iPad Pro 10.5",
                          
                          //iPod Touch
                          @"iPod4,1" : @"iPod Touch 4th",
                          @"iPod5,1" : @"iPod Touch 5th",
                          @"iPod7,1" : @"iPod Touch 6th"
                          };
    
    NSString *desc = map[rawMachine];
    return desc ? desc : @"Unknown Platform";
}

@end
