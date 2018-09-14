//
//  NSNull+SYCrash.m
//  demo
//
//  Created by apple on 2018/8/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSNull+SYCrash.h"

@implementation NSNull (SYCrash)

- (NSInteger)integerValue {
    return 0;
}

- (BOOL)boolValue {
    return NO;
}

- (double)doubleValue {
    return 0.0;
}

- (float)floatValue {
    return 0.0;
}

-(int)intValue {
    return 0;
}

- (long long)longLongValue {
    return 0.0;
}

- (NSUInteger)length {
    return 0;
}

- (NSUInteger)count {
    return 0;
}

- (id)objectAtIndex:(NSUInteger)index {
    return nil;
}

- (id)valueForKey:(NSString *)key {
    return nil;
}

- (id)objectForKey:(id)aKey {
    return nil;
}

- (id)firstObject {
    return nil;
}

- (id)lastObject {
    return nil;
}

@end
