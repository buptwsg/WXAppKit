//
//  WXTextField.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/22.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "WXTextField.h"

@implementation WXTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self addTarget: self action: @selector(textDidChanged:) forControlEvents: UIControlEventEditingChanged];
}

- (void)textDidChanged: (UITextField*)textField {
    NSString *lang =  UIApplication.sharedApplication.textInputMode.primaryLanguage;
    if ([lang containsString: @"zh-Han"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition: selectedRange.start offset: 0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (textField.text.length > self.maxLength) {
                textField.text = [textField.text substringToIndex: self.maxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else {
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else {
        if (textField.text.length > self.maxLength) {
            textField.text = [textField.text substringToIndex: self.maxLength];
        }
    }
}

@end
