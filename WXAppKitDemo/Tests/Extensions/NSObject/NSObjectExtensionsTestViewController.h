//
//  NSObjectExtensionsTestViewController.h
//  WXAppKitDemo
//
//  Created by sulirong on 2017/11/7.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "CaseExploreViewController.h"

@interface NSObjectExtensionsTestViewController : CaseExploreViewController

@end

@interface Human : NSObject

@property (nonatomic) int gender;

@end

@interface Student : Human

@property (nonatomic) unsigned int age;
@property (nonatomic) float distance;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *homeAddress;

@end

@interface School : NSObject
@property (nonatomic) NSUInteger numberOfGrades;
@property (nonatomic) NSUInteger numberOfClasses;
@property (copy, nonatomic) NSArray *students;
@end

