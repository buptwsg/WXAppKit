//
//  UIView+WXAutoSecureCoding.h
//  WXAppKit
//
//  Created by sulirong on 2017/11/6.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WXAutoSecureCoding)

@property (nonatomic, readonly) NSDictionary<NSString *, Class> *propertyNameClassDictionary;

@end
