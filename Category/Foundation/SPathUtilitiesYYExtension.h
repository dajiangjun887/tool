//
//  SPathUtilitiesYYExtension.h
//  demo
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef SPathUtilitiesYYExtension_h
#define SPathUtilitiesYYExtension_h

NSString *YYDocumentDirectory(void) {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

NSString *YYLibraryDirectory(void) {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
}

NSString *YYTmpDirectory(void) {
    return NSTemporaryDirectory();
}

NSString *YYCachDirectory(void) {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

NSString *YYPreferenceDirectory(void) {
    return [YYLibraryDirectory() stringByAppendingString:@"/Preferences"];
}

NSString *YYHomeDirectory(void) {
    return NSHomeDirectory();
}


#endif /* SPathUtilitiesYYExtension_h */
