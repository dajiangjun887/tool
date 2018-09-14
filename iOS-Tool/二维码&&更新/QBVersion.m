//
//  QBVersion.m
//  test
//
//  Created by huangqibiao on 2017/1/11.
//  Copyright © 2017年 huangqibiao. All rights reserved.
//
/*
  http://itunes.apple.com/lookup?id=1103150428你的应用程序的ID
  http://itunes.apple.com/lookup?bundleid=你的应用程序的budleid
 
 1：获取bundle Id信息：[[NSBundle mainBundle]bundleIdentifier]；
 2：获取版本号：[[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
 3：获取build号：[[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"];
 4：获取App显示名：[[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"];
 */

#import "QBVersion.h"

static QBVersion *manager = nil;

@interface QBVersion ()

@property (nonatomic, strong) NSString *appStoreId;
@property (nonatomic, strong) NSString *bundleIdentifier;

@end

@implementation QBVersion

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

+(void)load {
    manager = [self shareManager];
}

+ (void)setAppStoreId:(NSString *)appStoreId {
    manager.appStoreId = appStoreId;
}

+ (void)setBundleIdentifier:(NSString *)bundleIdentifier {
    manager.bundleIdentifier = bundleIdentifier;
}

- (NSString *)bundleIdentifier {
    if (!_bundleIdentifier) {
        _bundleIdentifier = [[NSBundle mainBundle]bundleIdentifier];
    }
    return _bundleIdentifier;
}

- (void)checkNewVersion {
    NSString *appStreURL = nil;
    if (self.appStoreId) {
        appStreURL = [@"id=" stringByAppendingString:self.appStoreId] ;
    } else {
        if (self.bundleIdentifier.length > 0) {
            appStreURL = [@"bundleId=" stringByAppendingString:self.bundleIdentifier];
        } else {
            NSAssert(self.bundleIdentifier, @"请设置appStoreId或设置bundleIdentifier");
        }
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?%@", appStreURL];
    NSURL *url =[NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *err = nil;
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
            if (!err && [jsonData[@"resultCount"] integerValue] > 0) {
                if ([jsonData isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *newVersionInfo = jsonData[@"results"][0];
                    NSString *versionNumber = newVersionInfo[@"version"];
                    NSString *releaseNotes = newVersionInfo[@"releaseNotes"];
                    NSString *trackViewUrl = newVersionInfo[@"trackViewUrl"];
                    
                    NSString *appVersion = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
                    BOOL update = [self compareVersionsFormAppStore:versionNumber WithAppVersion:appVersion];
                    
                    if (update) {
                        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"发现新版本" message: releaseNotes preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *ignoreAction = [UIAlertAction actionWithTitle:@"忽略" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
                        UIAlertAction *updateAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                            NSURL *url = [NSURL URLWithString:trackViewUrl];
                            if ([[UIApplication sharedApplication]canOpenURL:url]) {
                                [[UIApplication sharedApplication]openURL:url];
                            }
                        }];
                        [alertC addAction:ignoreAction];
                        [alertC addAction:updateAction];
                        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:nil];
                    }
                }else {
                    NSLog(@"数据加载失败");
                }
            }else {
                NSLog(@"---------\n\n\n\n%@", err);
            }
        }
    }];
    [dataTask resume];
}

+ (void)checkNewVersion {
    NSLock *lock = [[NSLock alloc]init];
    [lock lock];
    [manager checkNewVersion];
    [lock unlock];
}


//比较版本的方法，在这里我用的是Version来比较的, true就是有新版本，false就是没有新版本
- (BOOL)compareVersionsFormAppStore:(NSString*)appStoreVersion WithAppVersion:(NSString*)appVersion{
    NSString *newVersion = [appStoreVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString *currentVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSComparisonResult reuslt = [newVersion compare:currentVersion options:NSWidthInsensitiveSearch];
    
    if (reuslt == NSOrderedDescending) {
        return YES;
    }else {
        return NO;
    }
}

@end
