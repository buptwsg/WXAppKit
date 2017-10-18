//
//  NSArrayExtentionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSArrayExtensionsTestViewController.h"

static void testLogUnicodeSupport(UIView *rootView) {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"Please check the console output";
    [label sizeToFit];
    label.center = rootView.center;
    [rootView addSubview: label];
    
    NSArray *temp = @[@"中", @"国", @"人", @[@"美国", @"香蕉", @"人"]];
    NSLog(@"temp array content is %@", temp);
}

static TestCase TestCases[] = {
    {"Log Unicode Support", testLogUnicodeSupport}
};

@interface NSArrayExtensionsTestViewController ()

@end

@implementation NSArrayExtensionsTestViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.casesArray = TestCases;
        self.numberOfCases = sizeof(TestCases) / sizeof(TestCase);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
