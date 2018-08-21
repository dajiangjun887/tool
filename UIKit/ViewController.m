//
//  ViewController.m
//  demo
//
//  Created by apple on 2018/8/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"

#import <RKNotificationHub.h>
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightItem;

- (IBAction)rightItemAction:(UIBarButtonItem *)sender;
@property (nonatomic, strong) RKNotificationHub *hub;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 80, 40);
    [btn setTitle:@"点我就加99" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];

    self.rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItems = @[_rightItem];
    
    _hub = [[RKNotificationHub alloc]initWithBarButtonItem:_rightItem];
    [_hub setCircleColor:[UIColor colorWithRed:0.98 green:0.66 blue:0.2 alpha:1] labelColor:[UIColor whiteColor]];
    [_hub increment];
    [_hub moveCircleByX:-5 Y:3];
    
    self.rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"今天比较适合敲代码" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];

    self.navigationItem.rightBarButtonItems = @[self.rightItem, item2];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadNavigationItemsShadowWith:_rightItem];
}


- (IBAction)rightItemAction:(UIBarButtonItem *)sender {
    [_hub incrementBy:99];
    [_hub showCount];
    [_hub bump];
    
}

- (void)loadNavigationItemsShadowWith:(UIBarButtonItem *)item {
    
    
    NSArray <UIColor *> *colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor brownColor],[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor],[UIColor brownColor]];
    CGRect superFrame = CGRectZero;
    NSArray *subviews = @[];
    
    if (@available(iOS 11.0, *)) {
        UIView *__viewOwner = [self.rightItem valueForKey:@"__viewOwner"]; // _UIButtonBar
        UIView *_stackView = [__viewOwner valueForKey:@"_stackView"]; // _UIButtonBarStackView
        superFrame = _stackView.frame;
        superFrame.origin.y += 100;
        subviews = [_stackView subviews];
    } else {
        UIView *view = [item valueForKey:@"_view"];
        subviews = view.superview.subviews;
        
        superFrame = view.superview.frame;
        superFrame.origin.y += 100;
    }
    
    UIView *superView = [[UIView alloc]initWithFrame:superFrame];
    superView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:superView];
    
    for (int i=0; i<subviews.count; i++) {
        UIView *buttonItemView = subviews[i];
        UIView *subview = [[UIView alloc]initWithFrame:buttonItemView.frame];
        subview.backgroundColor = colors[i];
        [superView addSubview:subview];
    }
    /*
     id __viewOwner = [self.rightItem valueForKey:@"__viewOwner"]; // _UIButtonBar
     UIView *_stackView = [__viewOwner valueForKey:@"_stackView"]; // _UIButtonBarStackView
     
     po _stackView.frame
     (origin = (x = 240, y = 0), size = (width = 127, height = 44))
     
     po _stackView.subviews[0]
     <_UIButtonBarButton: 0x7fa741717270; frame = (0 0; 58 44); layer = <CALayer: 0x60000022b800>>
     
     po _stackView.subviews[1]
     <UIView: 0x7fa741517ad0; frame = (58 22; 8 0); layer = <CALayer: 0x604000434040>>
     
     po _stackView.subviews[2]
     <_UIButtonBarButton: 0x7fa741517cc0; frame = (66 0; 61 44); layer = <CALayer: 0x604000435680>>
     
     
     id _layoutViews = [__viewOwner valueForKey:@"_layoutViews"];  // __NSArrayM
     
     po [_layoutViews objectAtIndex:0]
     <_UIButtonBarButton: 0x7fedda71a110; frame = (0 0; 58 44); layer = <CALayer: 0x600000223080>>
     
     po [_layoutViews objectAtIndex:1]
     <UIView: 0x7fedda71cb10; frame = (58 22; 8 0); layer = <CALayer: 0x600000224aa0>>
     
     po [_layoutViews objectAtIndex:2]
     <_UIButtonBarButton: 0x7fedda71dbc0; frame = (66 0; 61 44); layer = <CALayer: 0x6000002248e0>>
     
     */
    
    
}


@end
