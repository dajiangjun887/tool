//
//  NSString+TransformURLToUTF8.h
//  字符串处理
//
//  Created by apple on 2018/1/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TransformToUTF8)



/// 转换为 UTF-8 URL
///
/// 无论如果已经是 utf-8 格式就不会重复转换
/// 不用判断字符串是否为 utf-8 格式
@property (nonatomic, copy, readonly) NSString *utf8URL;

/// 不会判断是否是 utf-8 格式，直接转换
/// 适用于已经知道不是utf-8编码
@property (nonatomic, copy, readonly) NSString *utf8URL2;

@end
