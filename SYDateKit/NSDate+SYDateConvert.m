//
//  NSDate+SYDateConvert.m
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSDate+SYDateConvert.h"

static NSDateFormatter * sharedDateFormatter = nil;

NSDateFormatter *SYDateFormatter(void) {
    return sharedDateFormatter;
}

@implementation NSDate (SYDateConvert)

- (NSString *)stringValueWithFormat:(NSString *)format {
    NSString *dateString = nil;
    NSDate *date = self;
    @synchronized (sharedDateFormatter) {
        sharedDateFormatter.dateFormat = format;
        dateString = [sharedDateFormatter stringFromDate:date];
    }
    return dateString;
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDate *date = nil;
    @synchronized (sharedDateFormatter) {
        sharedDateFormatter.dateFormat = format;
        date = [sharedDateFormatter dateFromString:dateString];
    }
    return date;
}

+ (NSDate *)dateWithTimestamp:(id)timestamp {
    double timeInterval = [timestamp doubleValue];
    return [NSDate dateWithTimeIntervalSinceNow:timeInterval];
}

@end

@implementation NSString (SYDateConvert)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDateFormatter = [[NSDateFormatter alloc]init];
    });
}

- (NSDate *)dateVlaueFromFormat:(NSString *)format {
        NSDate *date = nil;
    NSString *dateValue = [self copy];
    @synchronized (sharedDateFormatter) {
        sharedDateFormatter.dateFormat = format;
        date = [sharedDateFormatter dateFromString:dateValue];
    }
    return date;
}

+ (NSString *)stringFromTimestamp:(double)timestamp format:(NSString *)format{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [date stringValueWithFormat:format];
}

@end


