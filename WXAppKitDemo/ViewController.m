//
//  ViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/16.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "ViewController.h"
#import "ExtentionsTestViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *testCases;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testCases = @[@"Extensions Test"];
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
    switch (indexPath.row) {
        case 0: {
            UIViewController *vc = [[ExtentionsTestViewController alloc] init];
            [self.navigationController pushViewController: vc animated: YES];
            break;
        }
            
        default:
            break;
    }
}
@end
