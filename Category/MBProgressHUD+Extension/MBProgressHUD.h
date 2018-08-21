//
//  MBProgressHUD.h
//  Version 1.1.0
//  Created by Matej Bukovinski on 2.4.09.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@class MBBackgroundView;
@protocol MBProgressHUDDelegate;


extern CGFloat const MBProgressMaxOffset;

typedef NS_ENUM(NSInteger, MBProgressHUDMode) {
    /// UIActivityIndicatorView.
    MBProgressHUDModeIndeterminate,
    /// A round, pie-chart like, progress view.
    MBProgressHUDModeDeterminate,
    /// Horizontal progress bar.
    MBProgressHUDModeDeterminateHorizontalBar,
    /// Ring-shaped progress view.
    MBProgressHUDModeAnnularDeterminate,
    /// Shows a custom view.
    MBProgressHUDModeCustomView,
    /// Shows only labels.
    MBProgressHUDModeText
};

typedef NS_ENUM(NSInteger, MBProgressHUDAnimation) {
    /// Opacity animation
    MBProgressHUDAnimationFade,
    /// Opacity + scale animation (zoom in when appearing zoom out when disappearing)
    MBProgressHUDAnimationZoom,
    /// Opacity + scale animation (zoom out style)
    MBProgressHUDAnimationZoomOut,
    /// Opacity + scale animation (zoom in style)
    MBProgressHUDAnimationZoomIn
};

typedef NS_ENUM(NSInteger, MBProgressHUDBackgroundStyle) {
    /// Solid color background
    MBProgressHUDBackgroundStyleSolidColor,
    /// UIVisualEffectView or UIToolbar.layer background view
    MBProgressHUDBackgroundStyleBlur
};

typedef void (^MBProgressHUDCompletionBlock)(void);


NS_ASSUME_NONNULL_BEGIN


@interface MBProgressHUD : UIView

/// 创建并添加到`view`
///
/// `view`不可以为空
+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;

/// 从父视图移除
+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated;

/// 创建视图并指定它的父视图`view`
///
/// `view`不可以为空
+ (nullable MBProgressHUD *)HUDForView:(UIView *)view;

/// 创建视图并指定它的父视图`view`
///
/// `view`不可以为空
- (instancetype)initWithView:(UIView *)view;

/// 使`MBProgressHUD`可见
- (void)showAnimated:(BOOL)animated;

/// 隐藏`MBProgressHUD`
- (void)hideAnimated:(BOOL)animated;

/// 延迟隐藏
- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

///////////////////////////////////////////////////////////////////////////////
//
//                  属性设置
//
//////////////////////////////////////////////////////////////////////////////

/// 试图消失后事件
@property (weak, nonatomic) id<MBProgressHUDDelegate> delegate;
/// 试图消失后回调
@property (copy, nullable) MBProgressHUDCompletionBlock completionBlock;


/// 指定显示时长
///
/// 如果
///
/// 需要手动创建`self`
@property (assign, nonatomic) NSTimeInterval graceTime;

/// 最小显示时长
@property (assign, nonatomic) NSTimeInterval minShowTime;

/// 是否隐藏时从父视图移除
@property (assign, nonatomic) BOOL removeFromSuperViewOnHide;

///
@property (assign, nonatomic) MBProgressHUDMode mode;

/// 标签及指示器颜色
@property (strong, nonatomic, nullable) UIColor *contentColor UI_APPEARANCE_SELECTOR;

/// 动画类型
@property (assign, nonatomic) MBProgressHUDAnimation animationType UI_APPEARANCE_SELECTOR;

/// 相对于父视图的偏移量
@property (assign, nonatomic) CGPoint offset UI_APPEARANCE_SELECTOR;

/// 子视图的 `margin`
@property (assign, nonatomic) CGFloat margin UI_APPEARANCE_SELECTOR;

/// 标签的`size`
@property (assign, nonatomic) CGSize minSize UI_APPEARANCE_SELECTOR;

/// 强制改变指示器形状
@property (assign, nonatomic, getter = isSquare) BOOL square UI_APPEARANCE_SELECTOR;

/**
 * When enabled, the bezel center gets slightly affected by the device accelerometer data.
 * Has no effect on iOS < 7.0. Defaults to YES.
 */
@property (assign, nonatomic, getter=areDefaultMotionEffectsEnabled) BOOL defaultMotionEffectsEnabled UI_APPEARANCE_SELECTOR;

/// 进度 0.0~1.0
@property (assign, nonatomic) float progress;

/// 进度指示器
@property (strong, nonatomic, nullable) NSProgress *progressObject;

/// 包含文本与指示器的视图
@property (strong, nonatomic, readonly) MBBackgroundView *bezelView;

/// `bezelView`的父视图
@property (strong, nonatomic, readonly) MBBackgroundView *backgroundView;

/// 自定义视图 最好是 37x37 `pixels`
@property (strong, nonatomic, nullable) UIView *customView;

/// 显示的文本
@property (strong, nonatomic, readonly) UILabel *label;

/// 补充文本 `副标题`
@property (strong, nonatomic, readonly) UILabel *detailsLabel;

/// 可添加的事件
@property (strong, nonatomic, readonly) UIButton *button;

@end


@protocol MBProgressHUDDelegate <NSObject>

@optional

/// 在 `MBProgressHUD`消失后执行
- (void)hudWasHidden:(MBProgressHUD *)hud;

@end


/// 某种填充视图
@interface MBRoundProgressView : UIView 

/// 0.0~1.0
@property (nonatomic, assign) float progress;

/// 指示器颜色
@property (nonatomic, strong) UIColor *progressTintColor;

/// 背景颜色
@property (nonatomic, strong) UIColor *backgroundTintColor;

/// 指示器形状 NO = round or YES = annular. Defaults to round.
@property (nonatomic, assign, getter = isAnnular) BOOL annular;

@end


/**
 * A flat bar progress view.  进度条
 */
@interface MBBarProgressView : UIView

/// 0.0~1.0
@property (nonatomic, assign) float progress;

/// 指示器边框颜色
@property (nonatomic, strong) UIColor *lineColor;

/// 背景颜色
@property (nonatomic, strong) UIColor *progressRemainingColor;

/// 指示器颜色
@property (nonatomic, strong) UIColor *progressColor;

@end

@interface MBBackgroundView : UIView

/// 背景样式
@property (nonatomic) MBProgressHUDBackgroundStyle style;

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 || TARGET_OS_TV
/// 样式效果
@property (nonatomic) UIBlurEffectStyle blurEffectStyle;
#endif

/// 背景色
@property (nonatomic, strong) UIColor *color;

@end

NS_ASSUME_NONNULL_END
