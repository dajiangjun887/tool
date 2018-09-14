//
//  AppInconMagager.m
//  demo
//
//  Created by apple on 2018/1/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AppInconMagager.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation AppInconMagager

+ (void)changeAppIconWithIconName:(NSString *)iconName {
    
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    BOOL isCurrentIcon = [[UIApplication sharedApplication].alternateIconName isEqualToString:iconName];
    if (isCurrentIcon) {
        return;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}
@end


@interface UIViewController (AppIncon)
@end

@implementation UIViewController (AppIncon)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(dy_presentViewController:animated:completion:));
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)dy_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        } else {
            [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
            return;
        }
    }
    [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end

