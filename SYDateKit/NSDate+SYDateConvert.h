//
//  NSDate+SYDateConvert.h
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSDateFormatter *SYDateFormatter(void);

@interface NSDate (SYDateConvert)

- (NSString *)stringValueWithFormat:(NSString *)format;
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;
+ (NSDate *)dateWithTimestamp:(id)timestamp;

@end

@interface NSString (SYDateConvert)

- (NSDate *)dateVlaueFromFormat:(NSString *)format;
+ (NSString *)stringFromTimestamp:(double)timestamp format:(NSString *)format;

@end
