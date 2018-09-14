//
//  NSDate+SYDateUnit.h
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (SYDateUnit)

+ (NSCalendar *)shared;

@end

@interface NSDate (SYDateUnit)

@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger second;
@property (nonatomic, assign, readonly) NSInteger weekOfMonth;
@property (nonatomic, assign, readonly) NSInteger weekOfYear;

- (NSDate *)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value;
- (NSDate *)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v;
- (NSDate *)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s;

@end
