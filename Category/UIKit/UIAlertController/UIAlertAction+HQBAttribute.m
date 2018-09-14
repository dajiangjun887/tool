//
//  UIAlertAction+HQBAttribute_m.m
//  demo
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIAlertAction+HQBAttribute.h"

@implementation UIAlertAction (HQBAttribute_m)


- (void)hqb_setTitle:(NSString *)title {
    [self setValue:title forKey:@"_title"];
}

- (void)hqb_settitleTextAlignment:(NSTextAlignment) titleTextAlignment {
    [self setValue:@(titleTextAlignment) forKey:@"_titleTextAlignment"];
}

- (void)hqb_setTitleTextColor:(UIColor *)titleTextColor {
    [self setValue:titleTextColor forKey:@"_titleTextColor"];
}

- (void)hqb_setImage:(UIImage *)image {
    [self setValue:image forKey:@"_image"];
}

- (void)hqb_setImageTintColor:(UIColor *)imageTintColor {
    [self setValue:imageTintColor forKey:@"_imageTintColor"];
}

@end
