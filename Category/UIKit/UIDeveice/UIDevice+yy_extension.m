//
//  UIDevice+yy_extension.m
//  demo
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIDevice+yy_extension.h"

@implementation UIDevice (yy_extension)

- (NSString *)yy_homeDirectory {
    return NSHomeDirectory();
}

- (NSString *)yy_documentDirectory {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

- (NSString *)yy_libraryDirectory {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
}

- (NSString *)yy_tmpDirectory {
    return NSTemporaryDirectory();
}

- (NSString *)yy_preferenceDirectory {// Preferences
    return [self.yy_libraryDirectory stringByAppendingString:@"/Preferences"];
}

- (NSString *)yy_cacheDirectory {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}



@end
