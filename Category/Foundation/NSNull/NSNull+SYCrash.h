//
//  NSNull+SYCrash.h
//  demo
//
//  Created by apple on 2018/8/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (SYCrash)

@property (readonly) double doubleValue;
@property (readonly) float floatValue;
@property (readonly) int intValue;
@property (readonly) NSInteger integerValue;
@property (readonly) long long longLongValue ;
@property (readonly) BOOL boolValue;


@property (readonly) NSUInteger length;

@property (readonly) NSUInteger count;
- (id)objectAtIndex:(NSUInteger)index;

- (id)valueForKey:(NSString *)key;
- (id)objectForKey:(id)aKey;

@property (nonatomic, readonly) id firstObject;
@property (nonatomic, readonly) id lastObject;


@end
