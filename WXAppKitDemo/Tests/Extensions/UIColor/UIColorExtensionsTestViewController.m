//
//  UIColorExtensionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UIColorExtensionsTestViewController.h"
#import "UIColor+WXHex.h"

void testUIColorhex(UIView *rootView) {
    UIView *first = [[UIView alloc] initWithFrame: CGRectMake(0, 200, 200, 50)];
    first.backgroundColor = [UIColor wx_colorWithHexNumber: 0xFCE473];
    [rootView addSubview: first];
    
    UIView *second = [[UIView alloc] initWithFrame: CGRectMake(0, 200 + 70, 200, 50)];
    second.backgroundColor = [UIColor wx_colorWithHexNumber: 0xFCE473 alpha: 0.5];
    [rootView addSubview: second];
    
    UIView *third = [[UIView alloc] initWithFrame: CGRectMake(0, 200 + 70*2, 200, 50)];
    third.backgroundColor = [UIColor wx_colorWithHexString: @"FCE473"];
    [rootView addSubview: third];
    
    UIView *fourth = [[UIView alloc] initWithFrame: CGRectMake(0, 200 + 70*3, 200, 50)];
    fourth.backgroundColor = [UIColor wx_colorWithHexString: @"#FCE473" alpha: .5];
    [rootView addSubview: fourth];
}

static TestCase cases[] = {
    {"Create UIColor from Hex Number or String", testUIColorhex},
};

@interface UIColorExtensionsTestViewController ()

@end

@implementation UIColorExtensionsTestViewController

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
