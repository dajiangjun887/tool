//
//  QBQRcode.h
//  test
//
//  Created by huangqibiao on 2017/1/11.
//  Copyright © 2017年 huangqibiao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CallBack)(NSString *qrCodeValue, BOOL success);

@interface QBQRcode : NSObject


/**
 生成正方形二维码

 @param qrString 待成成二维码的字符串
 @param size 生成二维码的宽高
 @return 二维码图片
 */
+ (UIImage *)qbImageWithQRString:(NSString *)qrString withSize:(CGFloat)size;


/**
 扫描二维码

 @param callback 返回扫描到的数据
 */
+ (void)scanQRCodeWithCallBack:(CallBack)callback;

@end
