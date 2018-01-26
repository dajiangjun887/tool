#import <Foundation/Foundation.h>

/**
 设置
    - Targets -> Capacities -> Background model
    - Info.plist -> Required background modes
    - beginBackgroundModel()
 */
void beginBackgroundModel() {
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
}

