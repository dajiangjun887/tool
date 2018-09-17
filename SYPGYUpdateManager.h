//
//  PgySDKManager.h
//  demo
//
//  Created by apple on 2018/9/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

// 请配置 蒲公英 appKey, apiKey, 安装密码
@interface SYPGYUpdateConfig : NSObject

@property (nonatomic, copy, readonly) NSString *apiKey;
@property (nonatomic, copy, readonly) NSString *appKey;
@property (nonatomic, copy, readonly) NSString *installKey;
+ (instancetype)configWithApiKey:(NSString *)apiKey appKey:(NSString *)appKey installKey:(NSString *)installKey;

- (instancetype)init NS_UNAVAILABLE;

@end

/*!
 蒲公英更新
 
 ```
 
[SYPGYManager checkVersionCallback:^(NSError *error, BOOL isLastestVersion, NSDictionary *respondDict) {
    NSLog(@"%d\n%@", isLastestVersion, respondDict);
    if (!isLastestVersion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SYPGYManager installNewVersionInApp];
        });
    }
}];
 ```
*/
@interface SYPGYUpdateManager : NSObject

@property (class, nonatomic, strong) SYPGYUpdateConfig *updateConfig;

/// 跳转蒲公英后更新
+ (void)installNewVersionInSafari;
/// 应用内更新
+ (void)installNewVersionInApp;

/// 调用蒲公英api检测是否有新版本发布
+ (void)checkVersionCallback:(void(^)(NSError *error, BOOL isLastestVersion, NSDictionary *respondDict))callback;
@end
