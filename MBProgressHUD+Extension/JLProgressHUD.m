//
//  JLProgressHUD.m
//  demo2
//
//  Created by apple on 2018/1/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JLProgressHUD.h"

static JLProgressHUD *hudManager = nil;                          // 加载管理器
static NSString *progressHUDDefaultKey = @"JLProgressHUDDefaultKey"; // 默认key


@interface JLProgressHUD ()

@property (nonatomic, strong) NSMutableDictionary *jlKeyValus;

@end

@implementation JLProgressHUD



+ (void)load {
    [self appearance];
}

/// 默认值设置

- (UIImage *)successImage {
    if (_successImage == nil) {
        _successImage = [[UIImage imageNamed:@"JLProgressHUD.bundle/default_success.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    }
    return _successImage;
}

- (UIImage *)errorImage {
    if (_errorImage == nil) {
        _errorImage = [[UIImage imageNamed:@"JLProgressHUD.bundle/default_error.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    }
    return _errorImage;
}

- (UIImage *)promptImage {
    if (_promptImage == nil) {
        _promptImage = [[UIImage imageNamed:@"JLProgressHUD.bundle/default_prompt.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    }
    return _promptImage;
}

- (NSTimeInterval)autoHideTime {
    if (_autoHideTime == 0.0) {
        _autoHideTime = 1.5;
    }
    return _autoHideTime;
}

///
- (instancetype)initInstance
{
    self = [super init];
    if (self) {
        _jlKeyValus = @{}.mutableCopy;
    }
    return self;
}


+ (instancetype)appearance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hudManager = [[JLProgressHUD alloc]initInstance];
    });
    return hudManager;
}

///////////////////////////////////////////////////
//
//      构建hud
///////////////////////////////////////////////////

/// 结果提示

+ (void)showSucceess:(NSString *)message {
    [self showMessage:message image:hudManager.successImage];
}

+ (void)showError:(NSString *)errorMessage {
    [self showMessage:errorMessage image:hudManager.errorImage];
}

+ (void)showPrompt:(NSString *)promptMessage {
    [self showMessage:promptMessage image:hudManager.promptImage];
}

+ (void)showMessage:(NSString *)message image:(UIImage *)image {
    [self showMessage:message image:image inView:nil autoHide:YES afterHide:hudManager.autoHideTime hudKey:progressHUDDefaultKey];
}

/// 加载提示
+ (void)showLoading:(NSString *)message hudKey:(id)hudKey {
    [self showLoadingWithMessage:message inView:nil hudKey:hudKey];
}

+ (void)showLoadingWithMessage:(NSString *)message inView:(UIView *)view hudKey:(id)hudKey {
    [self showMessage:message image:nil inView:view autoHide:NO afterHide:0 hudKey:hudKey];
}



+ (void)showMessage:(NSString *)message image:(UIImage *)image inView:(UIView *)view autoHide:(BOOL)autoHide afterHide:(NSTimeInterval)hideTime hudKey:(id)hudKey {
    [self hidForKey:hudKey];
    MBProgressHUD *hud = [self hudWithView:view message:message image:image];
    [hud showAnimated:YES];
    if (!autoHide) {
        [hudManager.jlKeyValus setValue:hud forKey:hudKey];
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(hideTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

////////////////////////////////////////////////
//
//          隐藏显示
//
///////////////////////////////////////////////
+ (void)hidForKey:(id)key {
    MBProgressHUD *hud = [hudManager.jlKeyValus valueForKey:key];
    if (hud) {
        [hudManager.jlKeyValus removeObjectForKey:key];
        [hud hideAnimated:YES];
    }
}

+ (void)hide {
    [self hidForKey:progressHUDDefaultKey];
}

//////////////////////////////////////////////
//      private function
//
//////////////////////////////////////////////

+ (UIView *)inView:(UIView *)view {
    if ([view isKindOfClass:[UIView class]]) {
        return view;
    }
    return [UIApplication sharedApplication].keyWindow;
}

+ (MBProgressHUD *)hudWithView:(UIView *)view message:(NSString *)message image:(UIImage *)image{
    UIView *inView = [self inView:view];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:inView];
    hud.removeFromSuperViewOnHide = YES;
    if (image != nil) {
        hud.mode = MBProgressHUDModeCustomView;
        UIImageView *customView = [[UIImageView alloc]initWithImage:image];
        hud.customView = customView;
    }
    
    if (hudManager.contentColor != nil) {
        hud.contentColor = hudManager.contentColor;
    }
    
    if (hudManager.lableTextColor != nil) {
        hud.label.textColor = hudManager.lableTextColor;
    }
    if (hudManager.lableTextFont != nil) {
        hud.label.font = hudManager.lableTextFont;
    }
    
    if (hudManager.detailTextColor != nil) {
        hud.detailsLabel.textColor = hudManager.detailTextColor;
    }
    if (hudManager.detailTextFont != nil) {
        hud.detailsLabel.font = hudManager.detailTextFont;
    }
    
    [inView addSubview:hud];
    hud.label.text = message;
    return hud;
}


@end
