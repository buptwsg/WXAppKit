//
//  AntiCrashTestsViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/12/3.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "AntiCrashTestsViewController.h"

@interface OverrideForwardingTarget : NSObject

@end

@implementation OverrideForwardingTarget

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [NSMutableArray array];
}

@end

static void testInstanceSelector(UIView *rootView) {
    NSMutableArray *mutable = (NSMutableArray*)@[@1, @2, @3];
    [mutable addObject: @"33"];
}

static void testClassSelector(UIView *rootView) {
    [NSDictionary performSelector: @selector(dictionaryWithDictionary:) withObject: @{@"key" : @"value"}];
    [NSDictionary performSelector: @selector(addObserver:selector:name:object:) withObject: [NSArray array]];
}

static void testClassOverrideForwardingTarget(UIView *rootView) {
    OverrideForwardingTarget *test = [[OverrideForwardingTarget alloc] init];
    [test performSelector: @selector(addObject:) withObject: @1];
}

static TestCase TestCases[] = {
    {"Unrecognized instance selector", testInstanceSelector},
    {"Unrecognized class selector", testClassSelector},
    {"Class override forwarding target", testClassOverrideForwardingTarget}
};


@interface AntiCrashTestsViewController ()

@end

@implementation AntiCrashTestsViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
