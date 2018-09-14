//
//  UIBarButtonItem+SYCustomerInitializer.m
//  demo02
//
//  Created by apple on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIBarButtonItem+SYCustomerInitializer.h"

@implementation UIBarButtonItem (SYCustomerInitializer)

- (UIButton *)sy_customerView {
    return self.customView;
}

+ (instancetype)sy_barButtonItemWithImage:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *customerView = [UIButton buttonWithType:UIButtonTypeCustom];
    image? [customerView setImage:image forState:UIControlStateNormal] : nil;
    title? [customerView setTitle:title forState:UIControlStateNormal] : nil;
    [customerView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [customerView sizeToFit];
    [customerView addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:customerView];
}

+ (instancetype)sy_barButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    return [UIBarButtonItem sy_barButtonItemWithImage:image title:nil target:target action:action];
}

+ (instancetype)sy_barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    return [UIBarButtonItem sy_barButtonItemWithImage:nil title:title target:target action:action];
}

@end
