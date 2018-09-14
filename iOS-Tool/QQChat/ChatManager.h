//
//  ChatManager.h
//  ChatWithQQ
//
//  Created by apple on 2018/1/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatManager : NSObject

+ (BOOL)isQQInstalled;

+(void)chatWithQQ:(NSString *)QQ;

@end
