//
//  WXNavigationBar.m
//  WXAppKit
//
//  Created by sulirong on 2018/3/6.
//  Copyright © 2018年 buptwsg. All rights reserved.
//

#import "WXNavigationBar.h"

@implementation WXNavigationBar

-(instancetype)init {
    self = [super init];
    if (self) {
        _borderMarginForBarItem = 8;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (@available(iOS 11.0, *)) {
        for (UIView *view in self.subviews) {
            for (UIStackView *stackView in view.subviews) {
                if ([stackView isKindOfClass: [UIStackView class]]) {
                    stackView.superview.layoutMargins = UIEdgeInsetsMake(0, self.borderMarginForBarItem, 0, self.borderMarginForBarItem);
                    break;
                }
            }
        }
    }
}
@end
