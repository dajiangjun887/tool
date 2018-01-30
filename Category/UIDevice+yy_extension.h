//
//  UIDevice+yy_extension.h
//  demo
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 仿照 YY_Category 写的路径分类
 */
@interface UIDevice (yy_extension)

@property (nonatomic, copy, readonly) NSString *yy_documentDirectory;

@property (nonatomic, copy, readonly) NSString *yy_libraryDirectory;

@property (nonatomic, copy, readonly) NSString *yy_tmpDirectory;

@property (nonatomic, copy, readonly) NSString *yy_cacheDirectory;

@property (nonatomic, copy, readonly) NSString *yy_preferenceDirectory;

@property (nonatomic, copy, readonly) NSString *yy_homeDirectory;

@end

