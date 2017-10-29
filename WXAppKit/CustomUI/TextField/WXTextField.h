//
//  WXTextField.h
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/22.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTextField : UITextField

/**
 The maximum length of the inputted text
 */
@property (nonatomic) IBInspectable NSUInteger maxLength;

/**
 If set to YES, then 'maxLength' is interpreted as maximum number of bytes. Otherwise 'maxLength' is interpreted as maximum of textField.text.length.
 Default is NO.
 */
@property (nonatomic) IBInspectable BOOL limitByBytesLength;

@end
