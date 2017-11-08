//
//  NSObject+WXToDictionary.h
//  WXAppKit
//
//  Created by sulirong on 2017/11/8.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WXToDictionary)

@property (nonnull, nonatomic, readonly) NSDictionary *wx_dictionary;
@property (nonnull, nonatomic, readonly) NSString *wx_description;

@end

NS_ASSUME_NONNULL_END
