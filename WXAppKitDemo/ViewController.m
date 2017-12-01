//
//  ViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/16.
//  Copyright © 2017年 buptwsg. All rights reserved.
//
#import <objc/runtime.h>
#import "ViewController.h"
#import "ExtentionsTestViewController.h"
#import "CustomUITestsViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *testCases;
@property (strong, nonatomic) NSArray<Class> *testClasses;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testCases = @[@"Extensions Test", @"CustomUI Test"];
    self.testClasses = @[
                         [ExtentionsTestViewController class],
                         [CustomUITestsViewController class]
                         ];
    Method m = class_getInstanceMethod([self class], @selector(didReceiveMemoryWarning));
    const char *typeEncoding = method_getTypeEncoding(m);
    NSLog(@"type encoding is %s", typeEncoding);
}

- (int)myTestMethod: (int)a intb: (int)b intc:(int)c stringd: (NSString*)d {
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testCases.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath: indexPath];
    cell.textLabel.text = self.testCases[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    UIViewController *vc = [[self.testClasses[indexPath.row] alloc] init];
    [self.navigationController pushViewController: vc animated: YES];
}
@end
