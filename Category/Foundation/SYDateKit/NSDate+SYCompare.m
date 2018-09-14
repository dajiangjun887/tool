//
//  NSDate+SYCompare.m
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSDate+SYCompare.h"

@implementation NSDate (SYCompare)

- (NSDateComponents *)components {
    return [[NSCalendar shared]componentsInTimeZone:[NSCalendar shared].timeZone fromDate:self];
}


- (NSDateComponents *)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate {
    return [[NSCalendar shared]components:unitFlags fromDate:startingDate toDate:resultDate options:NSCalendarWrapComponents];
}

- (void)timeIntervalToDate:(NSDate *)date callback:(void(^)(SYDateComponents dateComponents))callback {
    NSCalendarUnit calendarUnits = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [self components:calendarUnits fromDate:self toDate:date];
    SYDateComponents dateComponent = {};
    dateComponent.era = dateComponent.era;
    dateComponent.year = [components year];
    dateComponent.month = [components month];
    dateComponent.day = [components day];
    dateComponent.hour = [components hour];
    dateComponent.minute = [components minute];
    dateComponent.second = [components second];
    callback? callback(dateComponent) : nil;
}

- (NSInteger)daysToDate:(NSDate *)date {
    return [self components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self toDate:date].day;
}


- (BOOL)isEqualToDate:(NSDate *)date in:(NSCalendarUnit)unit {
    return [[NSCalendar shared]isDate:self equalToDate:date toUnitGranularity:unit];
}


- (BOOL)isInSameWith:(NSDate *)date {
    return [[NSCalendar shared]isDate:self inSameDayAsDate:date];
}


- (BOOL)isDateInToday {
    return [[NSCalendar shared] isDateInToday:self];
}


- (BOOL)isDateInYesterday {
    return [[NSCalendar shared]isDateInYesterday:self];
}


- (BOOL)isDateInTomorrow {
    return [[NSCalendar shared]isDateInTomorrow:self];
}


- (BOOL)isDateInWeekend {
    return [[NSCalendar shared]isDateInWeekend:self];
}

@end
