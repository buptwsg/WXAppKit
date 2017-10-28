//
//  WXMiddleButtonTabBar.m
//  WXAppKit
//
//  Created by Shuguang Wang on 2017/10/22.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "WXMiddleButtonTabBar.h"

@interface WXMiddleButtonTabBar()

@property (strong, nonatomic) UIButton *middleButton;
@property (nonatomic) CGFloat middleButtonCenterY;

@end

@implementation WXMiddleButtonTabBar {
    NSMutableArray *_mutableImageViewsArray;
    NSMutableArray *_mutableLabelsArray;
}

static UIColor *_normalTextColor = nil;
static UIColor *_selectedTextColor = nil;

#pragma mark - Overrides
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)didAddSubview:(UIView *)subview {
    if ([subview isKindOfClass: NSClassFromString(@"UITabBarButton")]) {
        for (UIView *view in subview.subviews) {
            if ([view isKindOfClass: [UIImageView class]]) {
                [_mutableImageViewsArray addObject: view];
            }
            else if ([view isKindOfClass: [UILabel class]]) {
                [_mutableLabelsArray addObject: view];
            }
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.middleButton.center = CGPointMake(self.frame.size.width / 2, self.middleButtonCenterY);
    
    Class class = NSClassFromString(@"UITabBarButton");
    NSMutableArray *buttonsArray = [NSMutableArray array];
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass: class]) {
            [buttonsArray addObject: btn];
        }
    }
    
    int btnIndex = 0;
    CGFloat buttonWidth = self.frame.size.width / (buttonsArray.count + 1);
    for (UIView *btn in buttonsArray) {
        btn.frame = CGRectMake(buttonWidth * btnIndex, btn.frame.origin.y, buttonWidth, btn.frame.size.height);
        btnIndex++;

        if (btnIndex == buttonsArray.count / 2) {
            btnIndex++;
        }
    }
    
    [self bringSubviewToFront: self.middleButton];
}

//重写hitTest方法, 去监听中间按钮的点击, 目的是为了让凸出的部分也能响应点击事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //这是一个判断的关键, 不判断的话push到其他页面, 点击中间按钮的位置也是会有反应的, 这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在中间按钮身上
    //是的话让中间按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (!self.isHidden) {
        //将当前tabbar的触摸点转换坐标系，转换到中间按钮的身上，生成一个新的点
        CGPoint newPoint = [self convertPoint:point toView: self.middleButton];
        //判断如果这个新的点是在中间按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ([self.middleButton pointInside: newPoint withEvent: event]) {
            return self.middleButton;
        }
        else {//如果点不在中间按钮身上，直接让系统处理就可以了
            return [super hitTest: point withEvent: event];
        }
    }
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - public
- (void)setMiddleButton:(UIButton *)button atCenterY:(CGFloat)centerY {
    self.middleButton = button;
    self.middleButtonCenterY = centerY;
    [button sizeToFit];
    [self addSubview: button];
    
    [button addTarget: self action: @selector(middleButtonClicked) forControlEvents: UIControlEventTouchUpInside];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(middleButtonLongPressed:)];
    [button addGestureRecognizer: longPress];
}

#pragma mark - properties
+ (UIColor*)normalTextColor {
    return _normalTextColor;
}

+ (void)setNormalTextColor:(UIColor *)normalTextColor {
    _normalTextColor = normalTextColor;
}

+ (UIColor*)selectedTextColor {
    return _selectedTextColor;
}

+ (void)setSelectedTextColor:(UIColor *)selectedTextColor {
    _selectedTextColor = selectedTextColor;
}

- (NSArray*)imageViewsArray {
    return [_mutableImageViewsArray copy];
}

- (NSArray*)labelsArray {
    return [_mutableLabelsArray copy];
}

#pragma mark - private
- (void)commonInit {
    _mutableImageViewsArray = [NSMutableArray array];
    _mutableLabelsArray = [NSMutableArray array];
    
    UITabBarItem *tabBarItem = nil;
    if (@available(iOS 9.0, *)) {
        tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses: @[[self class]]];
    }
    else {
        tabBarItem = [UITabBarItem appearanceWhenContainedIn: [self class], nil];
    }
    
    UIColor *normalColor = self.class.normalTextColor;
    if (normalColor) {
        NSDictionary *normalAttributes = @{NSForegroundColorAttributeName : normalColor};
        [tabBarItem setTitleTextAttributes: normalAttributes forState: UIControlStateNormal];
    }
    
    UIColor *selectedColor = self.class.selectedTextColor;
    if (selectedColor) {
        NSDictionary *selectedAttributes = @{NSForegroundColorAttributeName : selectedColor};
        [tabBarItem setTitleTextAttributes: selectedAttributes forState: UIControlStateSelected];
    }
}

- (void)middleButtonClicked {
    if (self.wxDelegate && [self.wxDelegate respondsToSelector: @selector(tabBarMiddleButtonDidSelected:)]) {
        [self.wxDelegate tabBarMiddleButtonDidSelected: self];
    }
}

- (void)middleButtonLongPressed: (UILongPressGestureRecognizer*)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        if (self.wxDelegate && [self.wxDelegate respondsToSelector: @selector(tabBarMmiddleButtonDidLongPressed:)]) {
            [self.wxDelegate tabBarMmiddleButtonDidLongPressed: self];
        }
    }
}

@end
