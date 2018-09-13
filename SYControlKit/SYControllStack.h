//
//
//
//
//  Created by apple on 2018/9/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYControllStack : NSObject

+ (void)disableControll:(id)controll identifier:(NSString *)identifier;
+ (id)enableControllWithIdentifier:(NSString *)identifier;

+ (void)disableControll:(id)controll tag:(NSInteger)tag;
+ (id)enableControllWithTag:(NSInteger)tag;

@end
