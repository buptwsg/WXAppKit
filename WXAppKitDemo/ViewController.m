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

static NSInteger dictionaryTabCount = 0;
static NSInteger arrayTabCount = 0;
static NSInteger setTabCount = 0;

@implementation NSArray(Log)

- (NSString*)description {
    return @"simple description";
}

//- (NSString *)descriptionWithLocale:(id)locale
//{
//    NSString *logStr = [self yj_description:++arrayTabCount];
//    arrayTabCount = 0;
//    return logStr;
//}
//
//- (NSString*)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
//    NSLog(@"call indent version");
//    return @"This is array?";
//}

- (NSString *)yj_description:(NSInteger)depth
{
    NSMutableString *logStr = [NSMutableString string];
    
    [logStr appendFormat:@"(\n"];
    
    NSInteger arrayLength = self.count;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        for (NSInteger i = 1; i <= depth; ++i) {
            [logStr appendFormat:@"\t"];
        }
        
        if ([obj isKindOfClass:[NSArray class]]) {
            if (idx != arrayLength - 1) {
                [logStr appendFormat:@"%@,\n", obj];
            } else {
                [logStr appendFormat:@"%@\n", obj];
            }
            arrayTabCount = depth;
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            dictionaryTabCount = depth;
            if (idx != arrayLength - 1) {
                [logStr appendFormat:@"%@,\n", obj];
            } else {
                [logStr appendFormat:@"%@\n", obj];
            }
        } else if ([obj isKindOfClass:[NSSet class]]) {
            setTabCount = depth;
            if (idx != arrayLength - 1) {
                [logStr appendFormat:@"%@,\n", obj];
            } else {
                [logStr appendFormat:@"%@\n", obj];
            }
            
        } else {
            if (idx != arrayLength - 1) {
                [logStr appendFormat:@"%@,\n", obj];
            } else {
                [logStr appendFormat:@"%@\n", obj];
            }
        }
        
    }];
    for (NSInteger i = 1; i < depth; ++i) {
        [logStr appendFormat:@"\t"];
    }
    [logStr appendFormat:@")"];
    
    return logStr;
}

@end;


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *testCases;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testCases = @[@"Extensions Test"];
    NSArray *test = @[@"国庆", @"中国", @"2"];
    NSLog(@"test = %@", test);
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
