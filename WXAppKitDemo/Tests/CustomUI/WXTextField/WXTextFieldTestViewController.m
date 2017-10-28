//
//  WXTextFieldTestViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/28.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "WXTextFieldTestViewController.h"
#import "WXTextField.h"
#import "UIView+WXHelper.h"

static void testMaxLength(UIView *rootView) {
    WXTextField *textField = [[WXTextField alloc] initWithFrame: CGRectMake(0, 0, rootView.width, 50)];
    textField.center = rootView.center;
    textField.borderStyle = UITextBorderStyleLine;
    textField.maxLength = 10;
    [rootView addSubview: textField];
}

static void testMaxLengthInBytes(UIView *rootView) {
    UIView *view = [[[NSBundle mainBundle] loadNibNamed: @"WXTextFieldInXib" owner: nil options: nil] firstObject];
    if (view) {
        view.frame = CGRectMake(0, 100, rootView.width, 50);
        [rootView addSubview: view];
    }
}

static TestCase cases[] = {
    {"Test Max Length", testMaxLength},
    {"Test Max Length In Bytes", testMaxLengthInBytes}
};

@interface WXTextFieldTestViewController ()

@end

@implementation WXTextFieldTestViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.casesArray = cases;
        self.numberOfCases = sizeof(cases) / sizeof(TestCase);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
