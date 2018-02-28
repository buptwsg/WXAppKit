//
//  UITextView+VisualDebugger.m
//  WXAppKit
//
//  Created by sulirong on 2018/2/28.
//  Copyright © 2018年 buptwsg. All rights reserved.
//

#import "UITextView+VisualDebugger.h"

@implementation UITextView (VisualDebugger)

//重新定义下面的两个方法，可以解决有时候ViewDebugger出错的问题。
#if DEBUG
- (void)_firstBaselineOffsetFromTop {
    
}

- (void)_baselineOffsetFromBottom {
    
}
#endif

@end
