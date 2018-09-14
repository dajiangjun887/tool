//
//  NSDate+SYDateUnit.m
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSDate+SYDateUnit.h"

static NSCalendar *sharedCalendar = nil;

@implementation NSCalendar (SYDateUnit)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCalendar = [NSCalendar currentCalendar];
    });
}

+ (NSCalendar *)shared {
    return sharedCalendar;
}

@end

@interface NSDate ()
@property (nonatomic, strong, readonly) NSDateComponents *dateComponents;
@end

@implementation NSDate (SYDateUnit)

- (NSDateComponents *)dateComponents {
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear;

    return [sharedCalendar components:unitFlags fromDate:self];
}


- (NSInteger)year {
    return self.dateComponents.year;
}


- (NSInteger)month {
    return self.dateComponents.month;
}


- (NSInteger)day {
    return self.dateComponents.day;
}


- (NSInteger)hour {
    return self.dateComponents.hour;
}


- (NSInteger)minute {
    return self.dateComponents.minute;
}


- (NSInteger)second {
    return self.dateComponents.second;
}


- (NSInteger)weekOfMonth {
    return self.dateComponents.weekOfMonth;
}


- (NSInteger)weekOfYear {
    return self.dateComponents.weekOfYear;
}


- (NSDate *)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value {
    return [sharedCalendar dateByAddingUnit:unit value:value toDate:self options:NSCalendarWrapComponents];
}


- (NSDate *)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v  {
    return [sharedCalendar dateBySettingUnit:unit value:v ofDate:self options:NSCalendarWrapComponents];
}


- (NSDate *)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s {
    return [sharedCalendar dateBySettingHour:h minute:m second:s ofDate:self options:NSCalendarWrapComponents];
}

@end
