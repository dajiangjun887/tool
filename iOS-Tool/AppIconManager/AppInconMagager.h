//
//  AppInconMagager.h
//  demo
//
//  Created by apple on 2018/1/26.
//  Copyright © 2018年 apple. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface AppInconMagager : NSObject
/**
 change AppIcon with icon name that is configed in Info.plist

 */
+ (void)changeAppIconWithIconName:(NSString *)iconName;

@end
