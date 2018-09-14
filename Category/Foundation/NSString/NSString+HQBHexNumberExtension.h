//
//  NSString+HQBHexNumberExtension.h
//  demo
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HQBHexNumberExtension)

@property (nonatomic, readonly) float hexFloatValue;
@property (nonatomic, readonly) double hexDoubleValue;
@property (nonatomic, readonly) unsigned hexIntValue;
@property (nonatomic, readonly) unsigned long long hexIntegerValue;

@end


