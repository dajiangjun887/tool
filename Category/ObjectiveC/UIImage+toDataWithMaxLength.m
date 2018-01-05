//
//  UIImage+toDataWithMaxLength.m
//  color
//
//  Created by apple on 2018/1/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIImage+toDataWithMaxLength.h"

@implementation UIImage (toDataWithMaxLength)

- (NSData *)dateWithMaxLenth:(NSInteger)maxLenth {
    
    NSData *data = UIImageJPEGRepresentation(self, 1);
    if (data == nil) {
        return nil;
    }
    if (data.length < maxLenth) {
        return data;
    }else {
        return UIImageJPEGRepresentation(self, (CGFloat)maxLenth/data.length);
    }
}

@end
