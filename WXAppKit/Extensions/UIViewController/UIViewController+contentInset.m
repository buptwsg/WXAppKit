//
//  UIViewController+contentInset.m
//  WXAppKit
//
//  Created by sulirong on 2018/3/6.
//  Copyright © 2018年 buptwsg. All rights reserved.
//

#import "UIViewController+contentInset.h"

@implementation UIViewController (contentInset)

- (UIEdgeInsets)contentInset {
    if (@available(iOS 11.0, *)) {
        return self.view.safeAreaInsets;
    }
    else {
        CGFloat topMargin = self.topLayoutGuide.length;
        CGFloat bottomMargin = self.bottomLayoutGuide.length;
        return UIEdgeInsetsMake(topMargin, 0, bottomMargin, 0);
    }
}
@end
