//
//  SYButton.h
//  demo
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

// 不涉及富文本button
// 在selected, normal, highted, disable 时，文本、图片都存在时使用

typedef NS_ENUM(NSInteger, SYButtonStyle) {
    SYButtonStyleNormal = 0,
    SYButtonStyleHorizontallyRight,
    SYButtonStyleHorizontallyReverse,
    SYButtonStyleVerticalCenter,
};

@interface SYButton : UIButton

@property (nonatomic, strong) IBInspectable UIFont *sy_font;
@property (nonatomic, assign) IBInspectable NSInteger layoutStyle;
@property (nonatomic, assign) NSTimeInterval actionTimeInterval;

@end
