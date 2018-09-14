//
//  NSArray+SYDeepCopy.m
//  demo
//
//  Created by apple on 2018/9/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "Foundation+SYDeepCopy.h"

@interface NSObject (SYCollectionCopy)
- (id)sy_copy;
@end

@implementation NSObject (SYCollectionCopy)

- (id)sy_copy {
    
    BOOL isValid = [self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSSet class]] || [self isKindOfClass:[NSString class]];
        NSAssert(isValid, @"copy格式不正确");
        
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
}

@end


@implementation NSArray (SYDeepCopy)

- (id)deepCopy {
   return [[self sy_copy] copy];
}

- (id)mutableDeepCopy {
    return [[self sy_copy] mutableCopy];
}

@end

@implementation NSDictionary (SYDeepCopy)

- (id)deepCopy {
    return [[self sy_copy] copy];
}

- (id)mutableDeepCopy {
    return [[self sy_copy] mutableCopy];
}

@end


@implementation NSSet (SYDeepCopy)

- (id)deepCopy {
    return [[self sy_copy] copy];
}

- (id)mutableDeepCopy {
    return [[self sy_copy] mutableCopy];
}

@end

@implementation NSString (SYDeepCopy)

- (id)deepCopy {
    return [[self sy_copy] copy];
}

- (id)mutableDeepCopy {
    return [[self sy_copy] mutableCopy];
}

@end


