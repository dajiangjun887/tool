//
//  SYXibViewLoadFactory.h
//  demo
//
//  Created by apple on 2018/8/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYXibViewLoadFactory : NSObject

+ (SYXibViewLoadFactory *)defaultFactory;
- (instancetype)initWithBundel:(NSBundle *)bundle;

/// default is [NSBundle mainBundle]
@property (nonatomic, strong) NSBundle *bundle;
/// default is nil
@property (nonatomic, copy) NSString *nibName;

/**
 通过`xib`创建的`cell`, 不可以使用 `- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier` 注册
 注意：cell 需要在`xib`内部注册，传入的`identifier`要和注册的一致
 */
- (__kindof UITableViewCell *)cellWith:(UITableView *)tableView identifier:(NSString *)identifier nibName:(NSString *)nibName;

/**
 需要设置 `_nibName`

 */
- (__kindof UITableViewCell *)cellWith:(UITableView *)tableView identifier:(NSString *)identifier;

/**
 需要在`xib`第三栏设置 `restoration ID`

 */
- (__kindof UIView *)viewWithNibName:(NSString *) nibName restorationIdentifier:(NSString *)restorationIdentifier;
/// 需要设置 `_nibName`
- (__kindof UIView *)viewWithRestorationIdentifier:(NSString *)restorationIdentifier;


/**
 获取指定`storyboard` 下 `identifier`的 ViewControler
 @param identifier 是`storyboard ID`， 不是 `restoration ID`
 */
- (__kindof UIViewController *)viewControllerWithStoryboardName:(NSString *)storyboardName identifier:(NSString *)identifier;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (id)copy NS_UNAVAILABLE;
- (id)mutableCopy NS_UNAVAILABLE;

@end
