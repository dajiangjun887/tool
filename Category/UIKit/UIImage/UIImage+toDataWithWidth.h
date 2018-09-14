//
//  UIImage+toDataWithWidth.h
//  datademo
//
//  Created by apple on 2018/1/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (toDataWithWidth)

- (UIImage *)imageWithTargetWidth:(CGFloat)targetWidth;

- (NSData *)dataWithImageTargetWidth:(CGFloat)with;

@end
