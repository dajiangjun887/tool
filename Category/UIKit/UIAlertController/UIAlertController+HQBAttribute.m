//
//  UIAlertController+HQBAttribute.m
//  demo
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIAlertController+HQBAttribute.h"

@implementation UIAlertController (HQBAttribute)

- (void)hqb_setAttributedTitle:(NSAttributedString *)attributedTitle {
    [self setValue:attributedTitle forKey:@"_attributedTitle"];
}

- (void)hqb_setAttributedMessage:(NSAttributedString *)attributedMessage {
    [self setValue:attributedMessage forKey:@"_attributedMessage"];
}

- (void)hqb_setAttributedDetailMessage:(NSAttributedString *)attributedDetailMessage {
    [self setValue:attributedDetailMessage forKey:@"_attributedDetailMessage"];
}

- (void)hqb_setTitleLineBreakMode:(NSLineBreakMode )titleLineBreakMode {
    [self setValue:@(titleLineBreakMode) forKey:@"_titleLineBreakMode"];
}

- (void)hqb_setTitleMaximumLineCount:(NSInteger)titleMaximumLineCount {
    [self setValue:@(titleMaximumLineCount) forKey:@"_titleMaximumLineCount"];
}

- (void)hqb_setPreferredStyle:(UIAlertControllerStyle)preferredStyle {
    [self setValue:@(preferredStyle) forKey:@"_preferredStyle"];
}

@end
