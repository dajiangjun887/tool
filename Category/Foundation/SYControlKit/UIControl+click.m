//
//  UIControl+click.m
//  事件统计
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIControl+click.h"
#import <objc/runtime.h>

char *syIdentifier = "sy_identifier";

double const kDefaultTimerInterval = 2.0;

@implementation UIControl (click)

- (NSString *)sy_identifier {
    return objc_getAssociatedObject(self, syIdentifier);
}

- (void)setSy_identifier:(NSString *)sy_identifier {
    objc_setAssociatedObject(self,syIdentifier, sy_identifier, OBJC_ASSOCIATION_COPY);
}
+ (void)load {
    
    SEL n1 = @selector(sy_sendAction:to:forEvent:);
    Method m1 = class_getInstanceMethod([self class], n1);
    
    SEL n2 = @selector(sendAction:to:forEvent:);
    Method m2 = class_getInstanceMethod([self class], n2);
    
    BOOL didAddMethod = class_addMethod([self class], n2, method_getImplementation(m1), method_getTypeEncoding(m1));
    
    if (didAddMethod) {
        class_replaceMethod([self class], n1, method_getImplementation(m2), method_getTypeEncoding(m2));
    } else {
        method_exchangeImplementations(m1, m2);
    }
    
}

- (void)sy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"%@:%@:%@", NSStringFromSelector(action), target, event);
    if ([self isKindOfClass:[UIButton class]]) {
        
        self.enabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.sy_ButtonActionTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.enabled = YES;
        });
    }
    [self sy_sendAction:action to:target forEvent:event];
}


- (double)sy_ButtonActionTimeInterval {
    NSAssert([self isKindOfClass:[UIButton class]], @"sy_ButtonActionTimeInterval只适用于UIButton及其子类");
    double timeInterval = [objc_getAssociatedObject(self, _cmd) doubleValue];
    return timeInterval < 1.0 ? kDefaultTimerInterval : timeInterval;
}

- (void)setSy_ButtonActionTimeInterval:(double)sy_ButtonActionTimeInterval {
    NSAssert([self isKindOfClass:[UIButton class]], @"sy_ButtonActionTimeInterval只适用于UIButton及其子类");
    objc_setAssociatedObject(self, @selector(sy_ButtonActionTimeInterval), @(sy_ButtonActionTimeInterval), OBJC_ASSOCIATION_ASSIGN);
}




@end
