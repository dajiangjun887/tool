//
//  UIControl+click.h
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

extern double const kDefaultTimerInterval;

/*
  UIControl 打点统计
 
  UIButton 重复点击事件
 
 
 
 
 
 */

@interface UIControl (click)

@property (nonatomic, copy) NSString *sy_identifier;

@property (nonatomic, assign) double sy_ButtonActionTimeInterval;


@end
