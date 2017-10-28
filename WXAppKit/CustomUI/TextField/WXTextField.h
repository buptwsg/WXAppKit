//
//  WXTextField.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/22.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTextField : UITextField

@property (nonatomic) IBInspectable NSUInteger maxLength;

@property (nonatomic) IBInspectable BOOL limitByBytesLength;

@end
