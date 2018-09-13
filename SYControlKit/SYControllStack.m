//
//  
//
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SYControllStack.h"
#import <UIKit/UIKit.h>

@interface SYControllStack ()

@property (nonatomic, strong) NSMutableDictionary *controlls;

@end

static SYControllStack *stack = nil;
static const NSString *SYControllStackBaseTag = @"SYControllStackBaseTag";

@implementation SYControllStack

- (NSMutableDictionary *)controlls {
    if (!_controlls) {
        _controlls = @{}.mutableCopy;
    }
    return _controlls;
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stack = [[SYControllStack alloc]init];
    });
}

+ (void)disableControll:(id)controll tag:(NSInteger)tag {
    NSString *sy_tag = [NSString stringWithFormat:@"%@_%ld", SYControllStackBaseTag, tag];
    [self disableControll:controll identifier:sy_tag];
}

+ (id)enableControllWithTag:(NSInteger)tag {
    NSString *sy_tag = [NSString stringWithFormat:@"%@_%ld", SYControllStackBaseTag, tag];
    return [self enableControllWithIdentifier:sy_tag];
}

+ (void)disableControll:(id)controll identifier:(NSString *)identifier {
    BOOL isControll = [controll isKindOfClass:[UIControl class]];
    NSAssert(isControll, @"请传入UIControll子类");
    NSAssert(controll && identifier, @"controll和identifier都不可以为空");
    UIControl *ctrl = controll;
    ctrl.userInteractionEnabled = NO;
    stack.controlls[identifier] = controll;
}

+ (id)enableControllWithIdentifier:(NSString *)identifier {
    NSAssert(identifier, @"identifier不可以为空");
    
    UIControl *ctrl = stack.controlls[identifier];
    ctrl.userInteractionEnabled = YES;
    [stack.controlls removeObjectForKey:identifier];
    return ctrl;
}

@end
