//
//  SYMemoryWarning.h
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYMemoryWarning : NSObject

#if DEBUG
+ (void)performMemoryWarning;
#endif

@end
