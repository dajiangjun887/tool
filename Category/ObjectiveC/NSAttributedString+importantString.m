//
//  NSAttributedString+importantString.m
//  color
//
//  Created by apple on 2018/1/5.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSAttributedString+importantString.h"

@implementation NSAttributedString (importantString)

+ (instancetype)attributeImportantString:(NSString *)string starColor:(UIColor *)starColor fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor{
    
    NSString *starString = [string stringByAppendingString:@"*"];
    NSMutableAttributedString *colorString = [[NSMutableAttributedString alloc]initWithString:starString];
    [colorString setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} range:NSRangeFromString(starString)];
    [colorString setAttributes:@{NSForegroundColorAttributeName : textColor} range:NSRangeFromString(starString)];
    [colorString setAttributes:@{NSForegroundColorAttributeName : starColor} range:[starString rangeOfString:@"*"]];
    
    return colorString;
}

+ (instancetype)attributeImportantString:(NSString *)string fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self attributeImportantString:string starColor:[UIColor redColor] fontSize:fontSize textColor:textColor];
}

@end
