//
//  NSObject+WXAntiKVOCrash.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/12/3.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WXAntiKVOCrash)

- (void)wx_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end
