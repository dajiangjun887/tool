//
//  NSString+TransformURLToUTF8.m
//  字符串处理
//
//  Created by apple on 2018/1/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+TransformURLToUTF8.h"

@implementation NSString (TransformURLToUTF8)

- (NSString *)utf8URL {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSString *encodedString = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                     (CFStringRef)self,
                                                                                                     (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                                     NULL,
                                                                                                     kCFStringEncodingUTF8));
#pragma clang diagnostic pop
    
    return encodedString;
}

- (NSString *)setUtf8URL2:(NSString *)utf8URL2 {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

@end
