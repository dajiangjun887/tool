//
//  SYMemoryWarning.m
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SYMemoryWarning.h"
#import <UIKit/UIApplication.h>

@implementation SYMemoryWarning

+ (void)performMemoryWarning {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    
    SEL memoryWarningSel = @selector(_performMemoryWarning);
    if ([[UIApplication sharedApplication] respondsToSelector:memoryWarningSel]) {
        [[UIApplication sharedApplication] performSelector:memoryWarningSel];
    }else {
        NSLog(@"%@",@"Whoops UIApplication no loger responds to -_performMemoryWarning");
    }
#pragma clang diagnostic pop
}

@end
