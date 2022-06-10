//
//  NSMutableDictionary.m
//  SuperCoach
//
//  Created by 夜风 on 15/4/21.
//  Copyright (c) 2015年 Lin Feihong. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"

@implementation NSMutableDictionary(Extension)

- (void)setOB:(id)anObject forKey:(NSString *)aKey
{
    if (anObject != nil && aKey != nil) {
        [self setObject:anObject forKey:aKey];
    }
}
- (void)safeSetObject:(id)anObject forKey:(NSString *)aKey
{
    if (anObject != nil && aKey != nil) {
        [self setObject:anObject forKey:aKey];
    }
}
@end
