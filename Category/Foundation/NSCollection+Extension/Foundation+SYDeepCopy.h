//
//  NSArray+SYDeepCopy.h
//  demo
//
//  Created by apple on 2018/9/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SYDeepCopy)

- (id)deepCopy;
- (id)mutableDeepCopy;

@end


@interface NSDictionary (SYDeepCopy)

- (id)deepCopy;
- (id)mutableDeepCopy;

@end


@interface NSSet (SYDeepCopy)

- (id)deepCopy;
- (id)mutableDeepCopy;

@end


@interface NSString (SYDeepCopy)

- (id)deepCopy;
- (id)mutableDeepCopy;

@end
