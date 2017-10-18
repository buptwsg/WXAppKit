//
//  UIDeviceExtensionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/18.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UIDeviceExtensionsTestViewController.h"
#import "UIDevice+WXDeviceHelper.h"

static void testDeviceHelper(UIView *rootView) {
    NSMutableString *text = [NSMutableString string];
    if ([UIDevice wx_isIphone]) {
        [text appendString: @"This device is iPhone\n"];
    }
    else if ([UIDevice wx_isIpad]) {
        [text appendString: @"This device is iPad\n"];
    }
    else {
        [text appendString: @"This device is not iPhone or iPad\n"];
    }
    
    if ([UIDevice wx_isSimulator]) {
        [text appendString: @"This device is simulator.\n"];
    }
    else {
        [text appendString: @"This device is real hardware device.\n"];
    }
    
    [text appendString: @"device model is :\n"];
    [text appendString: [UIDevice wx_platformDescription]];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.text = text;
    [rootView addSubview: label];
    
    CGSize size = [label sizeThatFits: CGSizeMake(rootView.bounds.size.width, CGFLOAT_MAX)];
    label.frame = CGRectMake(0, (rootView.bounds.size.height - size.height) / 2, size.width, size.height);
}

static TestCase cases[] = {
    {"Test Device Helper", testDeviceHelper}
};

@interface UIDeviceExtensionsTestViewController ()

@end

@implementation UIDeviceExtensionsTestViewController

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
