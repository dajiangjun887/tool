//
//  UIAlertAction+HQBAttribute_m.h
//  demo
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (HQBAttribute_m)

- (void)hqb_setTitle:(NSString *)title;
- (void)hqb_settitleTextAlignment:(NSTextAlignment) titleTextAlignment;
- (void)hqb_setTitleTextColor:(UIColor *)titleTextColor;
- (void)hqb_setImage:(UIImage *)image;
- (void)hqb_setImageTintColor:(UIColor *)imageTintColor;

@end
