//
//  QBVersion.h
//  test
//
//  Created by huangqibiao on 2017/1/11.
//  Copyright © 2017年 huangqibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBVersion : NSObject

+ (void)setAppStoreId:(NSString *)appStoreId;
+ (void)setBundleIdentifier:(NSString *)bundleIdentifier;
+ (void)checkNewVersion;

@end
