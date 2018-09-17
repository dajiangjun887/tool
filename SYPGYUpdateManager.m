//
//  PgySDKManager.m
//  demo
//
//  Created by apple on 2018/9/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SYPGYUpdateManager.h"
#import <UIKit/UIKit.h>

@interface SYPGYUpdateConfig ()

@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *installKey;

@end

@implementation SYPGYUpdateConfig

+ (instancetype)configWithApiKey:(NSString *)apiKey appKey:(NSString *)appKey installKey:(NSString *)installKey {
    
    return [[SYPGYUpdateConfig alloc]initWithApiKey:apiKey appKey:appKey installKey:installKey];
}
- (instancetype)initWithApiKey:(NSString *)apiKey appKey:(NSString *)appKey installKey:(NSString *)installKey
{
    self = [super init];
    if (self) {
        self.apiKey = apiKey;
        self.appKey= appKey;
        self.installKey = installKey;
    }
    return self;
}

@end


SYPGYUpdateConfig *pgyUpdateConfig = nil;
@implementation SYPGYUpdateManager


+ (SYPGYUpdateConfig *)updateConfig {
    NSAssert(pgyUpdateConfig, @"请设置SYPGYUpdateConfig");
    return pgyUpdateConfig;
}

+ (void)setUpdateConfig:(SYPGYUpdateConfig *)updateConfig {
    pgyUpdateConfig = updateConfig;
}

+ (void)installNewVersionInApp {

    NSString *urlString = @"itms-services://?action=download-manifest&url=https%3A%2F%2Fwww.pgyer.com%2Fapiv2%2Fapp%2Fplist%3FappKey%3DSYPGYAPPKEY%26_api_key%3DSYPGYAPIKEY";
    urlString = [urlString stringByReplacingOccurrencesOfString:@"SYPGYAPIKEY" withString:self.updateConfig.apiKey];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"SYPGYAPPKEY" withString:self.updateConfig.appKey];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}


+ (void)installNewVersionInSafari{
    NSString *urlString = [NSString stringWithFormat:@"https://www.pgyer.com/apiv2/app/install?_api_key=%@&appKey=%@", self.updateConfig.apiKey, self.updateConfig.appKey];
    if (self.updateConfig.installKey && self.updateConfig.installKey > 0) {
        urlString = [urlString stringByAppendingFormat:@"&buildPassword=%@", self.updateConfig.installKey];
    }
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
    
}


+ (void)checkVersionCallback:(void(^)(NSError *error, BOOL isLastestVersion, NSDictionary *respondDict))callback {
    if (callback == nil) {
        return;
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    request.HTTPMethod = @"POST";
    NSString *buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSData *HTTPBody = [[NSString stringWithFormat:@"appKey=%@&_api_key=%@&buildVersion=%@", self.updateConfig.appKey, self.updateConfig.apiKey, buildVersion] dataUsingEncoding:NSUTF8StringEncoding];
    request.URL = [NSURL URLWithString:@"https://www.pgyer.com/apiv2/app/check"];
    request.HTTPBody = HTTPBody;
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            callback(error, NO, nil);
            return;
        } else {
            NSDictionary *respondInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSDictionary *versionInfo = respondInfo[@"data"];
            BOOL buildHaveNewVersion = [versionInfo[@"buildHaveNewVersion"] boolValue];
            callback(nil, !buildHaveNewVersion, versionInfo);
        }
    }] resume];
}

@end
