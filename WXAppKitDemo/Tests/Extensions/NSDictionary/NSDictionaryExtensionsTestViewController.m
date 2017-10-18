//
//  NSDictionaryExtentionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSDictionaryExtensionsTestViewController.h"

static void testLogUnicodeSupport(UIView *rootView) {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.text = @"Please check the console output";
    [label sizeToFit];
    label.center = rootView.center;
    [rootView addSubview: label];
    
    NSDictionary *temp = @{@"中" : @"国", @"美": @"女", @"帅" : @"哥", @"Array" : @[@"大", @"保", @"健", @{@"360" : @"就是奇虎啦"}]};
    NSLog(@"temp dictionary is %@", temp);
}

static TestCase TestCases[] = {
    {"Log Unicode Support", testLogUnicodeSupport}
};

@interface NSDictionaryExtensionsTestViewController ()

@end

@implementation NSDictionaryExtensionsTestViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
