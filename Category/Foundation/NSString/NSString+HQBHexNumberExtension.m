//
//  NSString+HQBHexNumberExtension.m
//  demo
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+HQBHexNumberExtension.h"

@implementation NSString (HQBHexNumberExtension)


- (unsigned long long)hexIntegerValue {
    NSString *hexString = [self convertToStandardHexString];
    NSScanner *scanner = [[NSScanner alloc]initWithString:hexString];
    unsigned long long result = 0;
    [scanner scanHexLongLong:&result];
    return result;
}

- (unsigned)hexIntValue {
    NSString *hexString = [self convertToStandardHexString];
    NSScanner *scanner = [[NSScanner alloc]initWithString:hexString];
    unsigned result = 0;
    [scanner scanHexInt:&result];
    return result;
}

- (double)hexDoubleValue {
    NSString *hexString = [self convertToStandardHexString];
    NSScanner *scanner = [[NSScanner alloc]initWithString:hexString];
    double result = 0.0;
    [scanner scanHexDouble:&result];
    return result;
}

- (float)hexFloatValue {
    NSString *hexString = [self convertToStandardHexString];
    NSScanner *scanner = [[NSScanner alloc]initWithString:hexString];
    float result = 0.0;
    [scanner scanHexFloat:&result];
    return result;
}

- (NSString *)convertToStandardHexString {
    NSString *reult = @"";
    if ([self hasPrefix:@"#"]) {
        reult = [self stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@"0x"];
    }
    
    if ([self hasPrefix:@"0x"] || [self hasPrefix:@"0X"]) {
        reult = self;
    }
    return [self isValidHexString:reult]? reult : @"0x0";
}

- (BOOL)isValidHexString:(NSString *)hexString {
    NSString *pattern = @"^[0x|0X][a-zA-Z0-9]{2,}";
    NSError *error = nil;
    NSRegularExpression *regularE = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *result = [regularE matchesInString:hexString options:0 range:NSMakeRange(0, hexString.length-1)];
    return result.count > 0;
}

@end


