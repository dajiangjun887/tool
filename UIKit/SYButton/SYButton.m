//
//  SYButton.m
//  demo
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SYButton.h"

@implementation SYButton

- (NSTimeInterval)actionTimeInterval {
    return _actionTimeInterval == 0? 2.5 : _actionTimeInterval;
}

- (void)setSy_font:(UIFont *)sy_font {
    _sy_font = sy_font;
    self.titleLabel.font = sy_font;
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    self.enabled = NO;
    [super sendAction:action to:target forEvent:event];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.actionTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.enabled = YES;
    });
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (![self imageForState:UIControlStateNormal]) {
        return;
    }
    
    if (![self titleForState:UIControlStateNormal]) {
        return;
    }
    [self relayoutImageTitle];
}


- (void)relayoutImageTitle {
    
    UIImage *image = [self imageForState:UIControlStateNormal];
    NSString *title = [self titleForState:UIControlStateNormal];
    
    CGSize buttonSize = self.frame.size;
    CGSize imageSize = image.size;
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    
    switch (_layoutStyle) {
        case SYButtonStyleHorizontallyRight:
            [self layoutHorizontallyRightWithButtonSize:buttonSize imageSize:imageSize titleSize:titleSize];
            break;
        case SYButtonStyleHorizontallyReverse:
            [self layoutHorizontallyReverseWithButtonSize:buttonSize imageSize:imageSize titleSize:titleSize];
            break;
        case SYButtonStyleVerticalCenter:
            [self layoutVerticalCenterWithButtonSize:buttonSize imageSize:imageSize titleSize:titleSize];
            break;
        default:
            break;
    }
}

- (void)layoutHorizontallyRightWithButtonSize:(CGSize)buttonSize imageSize:(CGSize)imageSize titleSize:(CGSize)titleSize {
    CGFloat contentWidth = imageSize.width + titleSize.width;
    CGFloat titleOriginX = 0;
    CGFloat titleWidth = 0;
    
    CGFloat imageOriginX = 0;
    CGFloat imageWidth = 0;
    if (contentWidth < buttonSize.width) {
        titleOriginX = buttonSize.width - contentWidth;
        titleWidth = titleSize.width;
        imageOriginX = titleOriginX + titleWidth;
        imageWidth = imageSize.width;
    } else if (imageSize.width < buttonSize.width) {
        titleOriginX = 0;
        titleWidth = buttonSize.width - imageSize.width;
        imageOriginX = titleWidth;
        imageWidth = imageSize.width;
    } else {
        titleOriginX = 0;
        titleWidth = 0;
        imageOriginX = 0;
        imageWidth = buttonSize.width;
    }
    
    CGFloat imageOriginY = 0;
    CGFloat imageHight = imageSize.height;
    if (imageSize.height < buttonSize.height) {
        imageOriginY = (buttonSize.height - imageSize.height) / 2.0;
    } else {
        imageHight = buttonSize.height;
    }
    
    CGFloat titleOriginY = (buttonSize.height - titleSize.height) / 2.0;
    self.imageView.frame = CGRectMake(imageOriginX, imageOriginY, imageWidth, imageHight);
    self.titleLabel.frame = CGRectMake(titleOriginX, titleOriginY, titleWidth, titleSize.height);
}

- (void)layoutHorizontallyReverseWithButtonSize:(CGSize)buttonSize imageSize:(CGSize)imageSize titleSize:(CGSize)titleSize {
    CGFloat contentWidth = imageSize.width + titleSize.width;
    CGFloat imageOriginX = 0;
    CGFloat imageWidth = imageSize.width;
    
    CGFloat titleOriginX = 0;
    CGFloat titleWidth = titleSize.width;
    
    if (contentWidth < buttonSize.width) {
        titleOriginX = (buttonSize.width - contentWidth) / 2.0;
        imageOriginX = titleOriginX + titleSize.width;
    } else if (imageSize.width < buttonSize.width) {
        titleOriginX = 0;
        titleWidth = buttonSize.width - imageSize.width;
        imageOriginX = titleWidth;
    } else {
        titleOriginX = 0;
        titleWidth = 0;
        imageOriginX = 0;
        imageWidth = buttonSize.width;
    }
    
    CGFloat imageOriginY = 0;
    CGFloat imageHight = imageSize.height;
    if (imageSize.height < buttonSize.height) {
        imageOriginY = (buttonSize.height - imageSize.height) / 2.0;
    } else {
        imageHight = buttonSize.height;
    }
    
    CGFloat titleOriginY = (buttonSize.height - titleSize.height) / 2.0;
    self.imageView.frame = CGRectMake(imageOriginX, imageOriginY, imageWidth, imageHight);
    self.titleLabel.frame = CGRectMake(titleOriginX, titleOriginY, titleWidth, titleSize.height);
}

- (void)layoutVerticalCenterWithButtonSize:(CGSize)buttonSize imageSize:(CGSize)imageSize titleSize:(CGSize)titleSize {
    CGFloat contentHeight = imageSize.height + titleSize.height;
    
    CGFloat imageOriginY = 0;
    CGFloat imageHight = imageSize.height;
    CGFloat titleHeight = titleSize.height;
    CGFloat titleOriginY = 0;
    
    if (contentHeight < buttonSize.height) {
        imageOriginY = (buttonSize.height - contentHeight) / 2.0;
        imageHight = imageSize.height;
        
        titleOriginY = imageOriginY + imageHight;
        titleHeight = titleSize.height;
        
    } else if (imageSize.height < buttonSize.height){
        imageOriginY = 0;
        imageHight = imageSize.height;
        
        titleOriginY = imageHight;
        titleHeight = buttonSize.height - imageHight;
    } else {
        imageOriginY = 0;
        imageHight = buttonSize.height;
        titleOriginY = 0;
        titleHeight = 0;
    }
    
    CGFloat imageOriginX = 0;
    CGFloat imageWidth = imageSize.width;
    if (imageSize.width < buttonSize.width) {
        imageOriginX = (buttonSize.width - imageSize.width) / 2.0;
    } else {
        imageWidth = buttonSize.width;
    }
    
    CGFloat titleOriginX = 0;
    CGFloat titleWidth = titleSize.width;
    if (titleSize.width < buttonSize.width) {
        titleOriginX = (buttonSize.width - titleSize.width) / 2.0;
    } else {
        titleWidth = buttonSize.width;
    }
    
    self.imageView.frame = CGRectMake(imageOriginX, imageOriginY, imageWidth, imageHight);
    self.titleLabel.frame = CGRectMake(titleOriginX, titleOriginY, titleWidth, titleHeight);
}


@end
