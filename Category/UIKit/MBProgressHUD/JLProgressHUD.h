//
//  JLProgressHUD.h
//  demo2
//
//  Created by apple on 2018/1/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN
@interface JLProgressHUD : NSObject

/// 显示前隐藏原来key对应的hud
/// 显示后添加key
/// 消失后移除key
/// 自定义 success、error、prompt、autoHideTime

+ (instancetype)appearance;

// 图片设置
@property (nonatomic, strong) UIImage *successImage;
@property (nonatomic, strong) UIImage *errorImage;
@property (nonatomic, strong) UIImage *promptImage;

// 样式设置
@property (nonatomic, assign) NSTimeInterval autoHideTime; ///< 自动隐藏时间
@property (nonatomic, strong) UIColor *lableTextColor; ///< 主标题颜色
@property (nonatomic, strong) UIFont *lableTextFont; ///< 主标题字体
@property (nonatomic, strong) UIColor *detailTextColor; ///< 副标题颜色
@property (nonatomic, strong) UIFont *detailTextFont;   ///< 副标题字体
@property (strong, nonatomic) UIColor *contentColor; ///< 指示器、lable、detailLable颜色


/// 成功提示
+ (void)showSucceess:(NSString *)message;

/// 错误提示
+ (void)showError:(NSString *)errorMessage;

/// 一般提示
+ (void)showPrompt:(NSString *)promptMessage;

/// 加载提示
///
/// hudKey 用于异步加载消失指定`HUD`
+ (void)showLoading:(NSString *)message hudKey:(id)hudKey;

/// hide for key
+ (void)hidForKey:(id)key;

/// hide for default key `progressHUDDefaultKey`
+ (void)hide;

///////////////
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
