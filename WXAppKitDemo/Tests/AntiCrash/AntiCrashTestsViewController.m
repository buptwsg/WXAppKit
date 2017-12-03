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
        [self testKVO];
    }
    return self;
}

- (void)testKVO {
    UIView *testView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
    testView.backgroundColor = [UIColor redColor];
    testView.center = self.view.center;
    [self.view addSubview: testView];
    
    [testView addObserver: self forKeyPath: @"frame" options: NSKeyValueObservingOptionInitial context: NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"AntiCrashTestsViewController, observeValueForKeyPath");
}
@end
