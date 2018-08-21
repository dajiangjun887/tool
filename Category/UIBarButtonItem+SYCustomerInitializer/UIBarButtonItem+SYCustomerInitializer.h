//
//  UIBarButtonItem+SYCustomerInitializer.h
//  demo02
//
//  Created by apple on 2018/8/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SYCustomerInitializer)

+ (instancetype)sy_barButtonItemWithImage:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)sy_barButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (instancetype)sy_barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@property (nonatomic, strong, readonly) UIButton *sy_customerView;

@end
