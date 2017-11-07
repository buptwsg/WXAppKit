//
//  NSObjectExtensionsTestViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/11/7.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "NSObjectExtensionsTestViewController.h"

static void testAutoSecureCoding(UIView *rootView) {
    School *mySchool = [[School alloc] init];
    mySchool.numberOfGrades = 3;
    mySchool.numberOfClasses = 3 * 8;
    
    NSMutableArray *studentsArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        Student *s = [[Student alloc] init];
        s.age = 10 + i;
        s.distance = 2 + 0.5 * i;
        s.name = [NSString stringWithFormat: @"Student %u %f", s.age, s.distance];
        s.homeAddress = @"Beijing";
        [studentsArray addObject: s];
    }
    mySchool.students = studentsArray;
    
    NSString *docDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [docDir stringByAppendingPathComponent: @"test.archive"];
    [NSKeyedArchiver archiveRootObject: mySchool toFile: filePath];
    
    School *recoveredSchool = [NSKeyedUnarchiver unarchiveObjectWithFile: filePath];
    NSLog(@"recovered school is %@", recoveredSchool);
}

static TestCase cases[] = {
    {"Test auto secure coding", testAutoSecureCoding}
};

@interface NSObjectExtensionsTestViewController ()

@end

@implementation Student
@end

@implementation School
@end

@implementation NSObjectExtensionsTestViewController

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
