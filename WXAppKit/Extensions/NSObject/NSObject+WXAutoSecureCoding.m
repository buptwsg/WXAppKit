//
//  NSObject+WXAutoSecureCoding.m
//  WXAppKit
//
//  Created by sulirong on 2017/11/6.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+WXAutoSecureCoding.h"

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

static const void *WXAutoSecureCodingDictionary = &WXAutoSecureCodingDictionary;

@implementation NSObject (WXAutoSecureCoding)

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary<NSString *, Class> *)propertyNameClassDictionary {
    unsigned int propertyCount = 0;
    NSMutableDictionary *propertyNameClassDict = [NSMutableDictionary dictionary];
    objc_property_t *properties = class_copyPropertyList(self, &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        NSString *key = @(propertyName);
        
        Class propertyClass = nil;
        char *typeEncoding = property_copyAttributeValue(property, "T");
        switch (typeEncoding[0]) {
            case '@': {
                if (strlen(typeEncoding) >= 3) {
                    char *className = strndup(typeEncoding + 2, strlen(typeEncoding) - 3);
                    NSString *name = @(className);
                    NSRange range = [name rangeOfString: @"<"];
                    if (range.location != NSNotFound) {
                        name = [name substringToIndex: range.location];
                    }
                    propertyClass = NSClassFromString(name) ?: [NSObject class];
                    free(className);
                }
                break;
            }
                
            case 'c'://char
            case 'i'://int
            case 's'://short
            case 'l'://long
            case 'q'://long long
            case 'C'://unsigned char
            case 'I'://unsigned int
            case 'S'://unsigned short
            case 'L'://unsigned long
            case 'Q'://unsigned long long
            case 'f'://float
            case 'd'://double
            case 'B'://bool
            {
                propertyClass = [NSNumber class];
                break;
            }
                
            case '{': {
                propertyClass = [NSValue class];
                break;
            }
        }
        
        free(typeEncoding);
        
        if (propertyClass) {
            //check if there is a backing ivar
            char *ivar = property_copyAttributeValue(property, "V");
            if (ivar) {
                //check if ivar has KVC-compliant name
                NSString *ivarName = @(ivar);
                if ([ivarName isEqualToString:key] || [ivarName isEqualToString:[@"_" stringByAppendingString:key]]) {
                    //no setter, but setValue:forKey: will still work
                    propertyNameClassDict[key] = propertyClass;
                }
                free(ivar);
            }
            else {
                //check if property is dynamic and readwrite
                char *dynamic = property_copyAttributeValue(property, "D");
                char *readonly = property_copyAttributeValue(property, "R");
                if (dynamic && !readonly) {
                    //no ivar, but setValue:forKey: will still work
                    propertyNameClassDict[key] = propertyClass;
                }
                free(dynamic);
                free(readonly);
            }
        }
    }
    
    free(properties);
    return propertyNameClassDict;
}

- (NSDictionary<NSString *, Class> *)propertyNameClassDictionary {
    NSDictionary *savedDictionary = objc_getAssociatedObject([self class], WXAutoSecureCodingDictionary);
    if (savedDictionary) {
        return savedDictionary;
    }
    
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionary];
    Class subclass = [self class];
    while (subclass != [NSObject class]) {
        [resultDictionary addEntriesFromDictionary: [subclass propertyNameClassDictionary]];
        subclass = [subclass superclass];
    }
    
    NSDictionary *finalDictionary = [resultDictionary copy];
    objc_setAssociatedObject([self class], WXAutoSecureCodingDictionary, finalDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return finalDictionary;
}

- (instancetype)initWithCoder: (NSCoder*)aDecoder {
    BOOL secureSupported = [[self class] supportsSecureCoding];
    NSDictionary<NSString *, Class> *properties = self.propertyNameClassDictionary;
    [properties enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull propertyName, Class  _Nonnull propertyClass, BOOL * _Nonnull stop) {
        id object = [aDecoder decodeObjectOfClass: propertyClass forKey: propertyName];
        if (object) {
            if (secureSupported && ![object isKindOfClass: propertyClass] && object != [NSNull null]) {
                [NSException raise: @"WXAutoSecureCodingException" format: @"Expected '%@' to be a %@, but was actually a %@", object, propertyClass, [object class]];
            }
            [self setValue: object forKey: propertyName];
        }
    }];
    
    return self;
}

- (void)encodeWithCoder: (NSCoder*)aCoder {
    for (NSString *propertyName in self.propertyNameClassDictionary) {
        id object = [self valueForKey: propertyName];
        if (object) {
            [aCoder encodeObject: object forKey: propertyName];
        }
    }
}

@end
