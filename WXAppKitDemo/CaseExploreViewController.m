//
//  CaseExploreViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/20.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "CaseExploreViewController.h"

@interface CaseExploreViewController ()

@property (nonatomic) NSInteger caseIndex;
@property (nonatomic, strong) UIButton *prevButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *runButton;

@property (nonatomic, strong) UILabel *caseNameLabel;

@property (nonatomic, strong) NSArray<UIView*> *excludeViews;

@end

@implementation CaseExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"用例浏览";
    self.caseIndex = 0;
    
    self.nextButton = [[UIButton alloc] init];
    [self.view addSubview: self.nextButton];
    self.nextButton.adjustsImageWhenDisabled = YES;
    [self.nextButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    [self.nextButton setTitle: @"下一个" forState: UIControlStateNormal];
    [self.nextButton addTarget: self action: @selector(nextCase) forControlEvents: UIControlEventTouchUpInside];
    [self.nextButton sizeToFit];
    self.nextButton.center = CGPointMake(self.view.bounds.size.width - 12 - self.nextButton.bounds.size.width/2, self.view.bounds.size.height - 50);
    self.nextButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    self.prevButton = [[UIButton alloc] init];
    self.prevButton.adjustsImageWhenDisabled = YES;
    [self.view addSubview: self.prevButton];
    [self.prevButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    [self.prevButton setTitle: @"上一个" forState: UIControlStateNormal];
    [self.prevButton addTarget: self action: @selector(prevCase) forControlEvents: UIControlEventTouchUpInside];
    [self.prevButton sizeToFit];
    self.prevButton.center = CGPointMake(12 + self.prevButton.bounds.size.width/2, self.view.bounds.size.height - 50);
    self.prevButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    
    self.runButton = [[UIButton alloc] init];
    [self.view addSubview: self.runButton];
    [self.runButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    [self.runButton setTitle: @"运行" forState: UIControlStateNormal];
    [self.runButton addTarget: self action: @selector(runCase) forControlEvents: UIControlEventTouchUpInside];
    [self.runButton sizeToFit];
    self.runButton.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 50);
    self.runButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    self.caseNameLabel = [[UILabel alloc] init];
    self.caseNameLabel.font = [UIFont systemFontOfSize: 20];
    self.caseNameLabel.textColor = [UIColor blackColor];
    self.caseNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.caseNameLabel];
    self.caseNameLabel.frame = CGRectMake(0, 10+64, self.view.bounds.size.width, 30);
    self.caseNameLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.excludeViews = @[self.prevButton, self.nextButton, self.runButton, self.caseNameLabel];
    [self updateButtonStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextCase {
    [self doClear];
    self.caseIndex += 1;
    [self loadCaseAtIndex: self.caseIndex];
    [self updateButtonStatus];
}

- (void)prevCase {
    [self doClear];
    self.caseIndex -= 1;
    [self loadCaseAtIndex: self.caseIndex];
    [self updateButtonStatus];
}

- (void)runCase {
    [self doClear];
    [self loadCaseAtIndex: self.caseIndex];
}

- (void)doClear {
    NSArray<UIView*> *subviews = [self.view subviews];
    [subviews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![self.excludeViews containsObject: obj]) {
            [obj removeFromSuperview];
        }
    }];
}

- (void)loadCaseAtIndex: (NSInteger)index {
    TestCase theCase = self.casesArray[index];
    NSString *title = @(theCase.caseTitle);
    self.caseNameLabel.text = title;
    if (theCase.pFunc) {
        theCase.pFunc(self.view);
    }
}

- (void)updateButtonStatus {
    if (self.caseIndex >= self.numberOfCases - 1) {
        self.nextButton.enabled = NO;
    }
    else {
        self.nextButton.enabled = YES;
    }
    
    if (self.caseIndex == 0) {
        self.prevButton.enabled = NO;
    }
    else {
        self.prevButton.enabled = YES;
    }
}

@end
