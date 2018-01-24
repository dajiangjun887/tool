//
//  ChatManager.m
//  ChatWithQQ
//
//  Created by apple on 2018/1/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ChatManager.h"
#import <UIKit/UIKit.h>

@implementation ChatManager

+ (BOOL)isQQInstalled {
    return [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"mqq://"]];
}

+(void)chatWithQQ:(NSString *)QQ
{
    NSString *url = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",QQ];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]options:@{UIApplicationOpenSettingsURLString:@YES} completionHandler:^(BOOL success) {
        NSLog(@"Is OK:%d", success);
    }];
}

@end
