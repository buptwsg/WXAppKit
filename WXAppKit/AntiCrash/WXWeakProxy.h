//
//  WXWeakProxy.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/29.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXWeakProxy : NSProxy

/**
 The proxy target.
 */
@property (weak, nonatomic, readonly) id target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
- (instancetype)initWithTarget:(id)target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
+ (instancetype)proxyWithTarget:(id)target;

@end
