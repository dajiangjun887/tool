//
//  UIImage+toDataWithWidth.m
//  datademo
//
//  Created by apple on 2018/1/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIImage+toDataWithWidth.h"

@implementation UIImage (toDataWithWidth)

/*!
 *  @author 黄仪标, 15-12-01 16:12:01
 *
 *  压缩图片至目标尺寸
 *
 *  @param targetWidth 图片最终尺寸的宽
 *
 *  @return 返回按照源图片的宽、高比例压缩至目标宽、高的图片
 */
- (UIImage *)imageWithTargetWidth:(CGFloat)targetWidth {
    CGSize imageSize = self.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetHeight = (targetWidth / width) * height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [self drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (NSData *)dataWithImageTargetWidth:(CGFloat)with {
    return UIImageJPEGRepresentation([self imageWithTargetWidth:with], 1.0);
}


@end
