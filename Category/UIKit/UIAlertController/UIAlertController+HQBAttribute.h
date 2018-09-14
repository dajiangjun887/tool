//
//  UIAlertController+HQBAttribute.h
//  demo
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (HQBAttribute)

- (void)hqb_setAttributedTitle:(NSAttributedString *)attributedTitle;
- (void)hqb_setAttributedMessage:(NSAttributedString *)attributedMessage;
- (void)hqb_setAttributedDetailMessage:(NSAttributedString *)attributedDetailMessage;
- (void)hqb_setTitleLineBreakMode:(NSLineBreakMode )titleLineBreakMode;
- (void)hqb_setTitleMaximumLineCount:(NSInteger)titleMaximumLineCount;
- (void)hqb_setPreferredStyle:(UIAlertControllerStyle)preferredStyle;
@end
