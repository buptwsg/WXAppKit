//
//  ViewController.m
//  WXAppKitDemo
//
//  Created by sulirong on 2017/10/16.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "ViewController.h"

//@interface NSArray (Log)
//@end

//@implementation NSArray (Log)
//- (NSString*)descriptionWithLocale:(id)locale {
//    NSLog(@"call with locale");
//    return @"NSArray description with locale";
//}
//
//- (NSString*)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
//    NSLog(@"call with locale and indent");
//    return @"description with locale, indent";
//}
//
//@end

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
@end
