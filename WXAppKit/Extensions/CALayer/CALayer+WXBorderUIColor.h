//
//  CALayer+WXBorderUIColor.h
//  WXAppKit
//
//  Created by sulirong on 2017/12/26.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIColor.h>

/**
 Use layer.borderUIColor in User Defined Runtime Attributes.
 */
@interface CALayer (WXBorderUIColor)

@property (nonatomic, unsafe_unretained) UIColor *borderUIColor;

@end
