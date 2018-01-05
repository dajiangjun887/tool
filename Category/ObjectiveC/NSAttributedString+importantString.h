//
//  NSAttributedString+importantString.h
//  color
//
//  Created by apple on 2018/1/5.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (importantString)


+ (instancetype)attributeImportantString:(NSString *)string starColor:(UIColor *)starColor fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;

+ (instancetype)attributeImportantString:(NSString *)string fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;

@end
