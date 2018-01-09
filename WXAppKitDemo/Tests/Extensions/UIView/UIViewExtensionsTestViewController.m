//
//  UIViewExtensionsTestViewController.m
//  WXAppKitDemo
//
//  Created by Shuguang Wang on 2017/10/20.
//  Copyright © 2017年 buptwsg. All rights reserved.
//

#import "UIViewExtensionsTestViewController.h"
#import "UIView+WXHelper.h"
#import "UIView+WXAutoResizingMaskLayout.h"

static void testFrameShortcut(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    NSString *result = [NSString stringWithFormat:@"left = %f, top = %f, right = %f, bottom = %f, centerX = %f, centerY = %f, width = %f, height = %f, origin = %@, size = %@", view.left, view.top, view.right, view.bottom, view.centerX, view.centerY, view.width, view.height, NSStringFromCGPoint(view.origin), NSStringFromCGSize(view.size)];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0, 350, rootView.width, 400)];
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 0;
    label.text = result;
    [rootView addSubview: label];
}

static void testFrameSetLeftAndTop(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.left -= 50;
        view.top -= 50;
    });
}

static void testFrameSetRightAndBottom(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.right += 50;
        view.bottom += 50;
    });
}

static void testFrameSetCenter(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.centerX -= 50;
        view.centerY -= 50;
    });
}

static void testFrameSetWidthHeight(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.width -= 50;
        view.height -= 50;
    });
}

static void testFrameSetOrigin(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.origin = CGPointMake(200, 100);
    });
}

static void testFrameSetSize(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.size = CGSizeMake(100, 200);
    });
}

static void testScale(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"initial scaleX is %f, scaleY is %f", view.scaleX, view.scaleY);
        view.scaleX = 1.5;
        view.scaleY = 2;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"current scaleX is %f, scaleY is %f", view.scaleX, view.scaleY);
        view.scale = CGPointMake(1, 1);
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"Finally, scale is (%f, %f)", view.scaleX, view.scaleY);
    });
}

static void testRotation(UIView *rootView) {
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [rootView addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.rotation = 45;
        NSLog(@"view's rotation is %f", view.rotation);
    });
}

static void testViewController(UIView *rootView) {
    UIViewController *rootVC = rootView.wx_viewController;
    NSLog(@"rootVC is %@", rootVC);
    
    UIViewController *childVC = [[UIViewController alloc] init];
    [rootVC addChildViewController: childVC];
    [rootView addSubview: childVC.view];
    [childVC didMoveToParentViewController: rootVC];
    NSLog(@"childVC is %@", childVC);
    
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(100, 200, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [childVC.view addSubview: view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *test = view.wx_viewController;
        NSLog(@"test = %@, test.navigationController = %@, rootVC.navigationController = %@", test, test.navigationController, rootVC.navigationController);
        [test.view removeFromSuperview];
        [test removeFromParentViewController];
    });
}

static void testIsPortrait(UIView *rootView) {
    if (rootView.isPortrait) {
        NSLog(@"now UI is portrait");
    }
    else {
        NSLog(@"now UI is landscape");
    }
}

static void testSnapCornerAndCenter(UIView *rootView) {
    UIView *containerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 300, 300)];
    containerView.layer.borderWidth = 1;
    containerView.layer.borderColor = [UIColor redColor].CGColor;
    [rootView addSubview: containerView];
    [containerView centerInSuperView];
    
    CGFloat wh = 50;
    UIView *topLeft = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    topLeft.backgroundColor = [UIColor redColor];
    [containerView addSubview: topLeft];
    topLeft.snapLeft(10).and.snapTop(10);
    
    UIView *topRight = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    topRight.backgroundColor = [UIColor greenColor];
    [containerView addSubview: topRight];
    topRight.snapRight(10).and.snapTop(10);
    
    UIView *bottomLeft = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    bottomLeft.backgroundColor = [UIColor blueColor];
    [containerView addSubview: bottomLeft];
    bottomLeft.snapBottom(10).and.snapLeft(10);
    
    UIView *bottomRight = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    bottomRight.backgroundColor = [UIColor purpleColor];
    [containerView addSubview: bottomRight];
    bottomRight.snapBottom(10).and.snapRight(10);
    
    UIView *topCenter = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    topCenter.backgroundColor = [UIColor cyanColor];
    [containerView addSubview: topCenter];
    topCenter.snapHCenter.and.snapTop(10);
    
    UIView *bottomCenter = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    bottomCenter.backgroundColor = [UIColor orangeColor];
    [containerView addSubview: bottomCenter];
    bottomCenter.snapHCenter.and.snapBottom(10);
    
    UIView *leftCenter = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    leftCenter.backgroundColor = [UIColor blackColor];
    [containerView addSubview: leftCenter];
    leftCenter.snapVCenter.and.snapLeft(10);
    
    UIView *rightCenter = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    rightCenter.backgroundColor = [UIColor yellowColor];
    [containerView addSubview: rightCenter];
    rightCenter.snapVCenter.and.snapRight(10);
    
    UIView *center = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wh, wh)];
    center.backgroundColor = [UIColor magentaColor];
    [containerView addSubview: center];
    [center centerInSuperView];
    
    [UIView animateWithDuration: 1 delay: 1 options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        containerView.frame = CGRectMake((rootView.width - 400)/2, (rootView.height - 400)/2, 400, 400);
    } completion: nil];
}

static void testFlexibleWH(UIView *rootView) {
    UIView *containerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 300, 300)];
    containerView.layer.borderWidth = 1;
    containerView.layer.borderColor = [UIColor redColor].CGColor;
    [rootView addSubview: containerView];
    [containerView centerInSuperView];
    
    UIView *fw = [[UIView alloc] init];
    fw.backgroundColor = [UIColor orangeColor];
    fw.height = 50;
    [containerView addSubview: fw];
    fw.snapVCenter.and.flexibleWidth(10, 20);
    
    UIView *fh = [[UIView alloc] init];
    fh.backgroundColor = [UIColor yellowColor];
    fh.width = 50;
    [containerView addSubview: fh];
    fh.snapHCenter.and.flexibleHeight(10, 20);
    
    [UIView animateWithDuration: 1 delay: 1 options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        containerView.frame = CGRectMake((rootView.width - 400)/2, (rootView.height - 400)/2, 400, 400);
    } completion: nil];
}

static void testFillWithEdges(UIView *rootView) {
    UIView *containerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 300, 300)];
    containerView.layer.borderWidth = 1;
    containerView.layer.borderColor = [UIColor redColor].CGColor;
    [rootView addSubview: containerView];
    [containerView centerInSuperView];
    
    UIView *fwh = [[UIView alloc] init];
    fwh.backgroundColor = [UIColor yellowColor];
    [containerView addSubview: fwh];
    fwh.fillSuperViewWithEdges(UIEdgeInsetsMake(10, 10, 10, 10));
    
    [UIView animateWithDuration: 1 delay: 1 options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        containerView.frame = CGRectMake((rootView.width - 400)/2, (rootView.height - 400)/2, 400, 400);
    } completion: nil];
}

static void testPrettyPrintSubviewHierarchy(UIView *rootView) {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"请查看控制台输出";
    [label sizeToFit];
    label.center = rootView.center;
    [rootView addSubview: label];
    
    [[[UIApplication sharedApplication] keyWindow] wx_prettyPrintSubviewHierarchy];
}

static TestCase cases[] = {
    {"Test frame shortcut reader", testFrameShortcut},
    {"Test frame set left and top", testFrameSetLeftAndTop},
    {"Test frame set right and bottom", testFrameSetRightAndBottom},
    {"Test frame set center", testFrameSetCenter},
    {"Test frame set width and height", testFrameSetWidthHeight},
    {"Test frame set orign", testFrameSetOrigin},
    {"Test frame set size", testFrameSetSize},
    {"Test Scale", testScale},
    {"Test Rotation", testRotation},
    {"Test View Controller", testViewController},
    {"Test isPortrait", testIsPortrait},
    {"Test snap corner and center", testSnapCornerAndCenter},
    {"Test flexible width and height", testFlexibleWH},
    {"Test fill with edges", testFillWithEdges},
    {"Test pretty print subview hierarchy", testPrettyPrintSubviewHierarchy}
};

@interface UIViewExtensionsTestViewController ()

@end

@implementation UIViewExtensionsTestViewController

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
