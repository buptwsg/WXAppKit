//
//  NSAttributedStringExtensionsTestViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/21.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSAttributedStringExtensionsTestViewController.h"
#import "NSAttributedString+WXHeight.h"

static void testHeightCalculation(UIView *rootView) {
    UILabel *label = [[UILabel alloc] init];
    label.layer.borderWidth = 1;
    label.layer.borderColor = [UIColor greenColor].CGColor;
    label.numberOfLines = 0;
    [rootView addSubview: label];
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString: @"中超第28轮联赛一场焦点战，天津权健主场2-1逆转取胜河北华夏幸福。第11分钟张利峰门前头球补射打破僵局，第45分钟拉维奇错失单刀良机，第52分钟帕托射失点球，第60分钟郑达伦接帕托开出的角球俯身冲顶破门，第78分钟帕托禁区内冷静推射近角反超比分。拿下这场关键之战，天津权健目前落后河北华夏幸福1分，排在积分榜第四名。" attributes: @{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize: 20]}];
    label.attributedText = string;
    CGFloat height = [string wx_heightThatFitWidth: 300];
    label.frame = CGRectMake(20, 200, 300, height);
}

static TestCase cases[] = {
    {"Test height calculation", testHeightCalculation}
};

@interface NSAttributedStringExtensionsTestViewController ()

@end

@implementation NSAttributedStringExtensionsTestViewController

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
