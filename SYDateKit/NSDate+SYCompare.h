//
//  NSDate+SYCompare.h
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+SYDateUnit.h"
typedef struct SYDate {
    NSInteger era;
    NSInteger year;
    NSInteger month;
    NSInteger day;
    NSInteger hour;
    NSInteger minute;
    NSInteger second;
} SYDateComponents;

__IOS_AVAILABLE(8.0)
@interface NSDate (SYCompare)

@property (nonatomic, assign, readonly) BOOL isDateInToday;
@property (nonatomic, assign, readonly) BOOL isDateInYesterday;
@property (nonatomic, assign, readonly) BOOL isDateInTomorrow;
@property (nonatomic, assign, readonly) BOOL isDateInWeekend;

- (BOOL)isInSameWith:(NSDate *)date;
- (BOOL)isEqualToDate:(NSDate *)date in:(NSCalendarUnit)unit;
- (NSInteger)daysToDate:(NSDate *)date;
- (void)timeIntervalToDate:(NSDate *)date callback:(void(^)(SYDateComponents dateComponents))callback;
- (NSDateComponents *)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate;

@end
