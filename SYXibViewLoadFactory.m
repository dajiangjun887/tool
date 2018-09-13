//
//  SYXibViewLoadFactory.m
//  demo
//
//  Created by apple on 2018/8/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SYXibViewLoadFactory.h"

static SYXibViewLoadFactory *_defaultFactory = nil;

@implementation SYXibViewLoadFactory

+ (instancetype)new {
    return nil;
}
- (instancetype)init {
    return nil;
}

- (NSString *)nibName {
    NSAssert(_nibName, @"SYXibViewLoadFactory: 请设置nibNme或使用包含nibName的方法");
    return _nibName;
}

+ (SYXibViewLoadFactory *)defaultFactory {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       _defaultFactory = [[SYXibViewLoadFactory alloc]initWithBundel:nil];
    });
    return _defaultFactory;
}

- (instancetype)initWithBundel:(NSBundle *)bundle
{
    self = [super init];
    if (self) {
        _bundle = bundle? bundle : [NSBundle mainBundle];
    }
    return self;
}


- (UITableViewCell *)cellWith:(UITableView *)tableView identifier:(NSString *)identifier {
    return [self cellWith:tableView identifier:identifier nibName:self.nibName];
}

- (UITableViewCell *)cellWith:(UITableView *)tableView identifier:(NSString *)identifier nibName:(NSString *)nibName{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [self cellFromBundleWithIdentifier:identifier nibName:nibName];
    }
    return cell;
}

- (UITableViewCell *)cellFromBundleWithIdentifier:(NSString *)identifier nibName:(NSString *)nibName{
    NSArray *cellArray = [self.bundle loadNibNamed:nibName owner:nil options:nil];
    for (UITableViewCell *cell in cellArray) {
        if ([cell.reuseIdentifier isEqualToString:identifier]) {
            return cell;
        }
    }
    return nil;
}

- (UIView *)viewWithNibName:(NSString *) nibName restorationIdentifier:(NSString *)restorationIdentifier {
    NSArray *views = [self.bundle loadNibNamed:nibName owner:nil options:nil];
    for (UIView *view in views) {
        if ([view.restorationIdentifier isEqualToString:restorationIdentifier]) {
            return view;
        }
    }
    return nil;
}

- (__kindof UIView *)viewWithRestorationIdentifier:(NSString *)restorationIdentifier {
    return [self viewWithNibName:self.nibName restorationIdentifier:restorationIdentifier];
}

- (UIViewController *)viewControllerWithStoryboardName:(NSString *)storyboardName identifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:self.bundle];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

@end
