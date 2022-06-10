//
//  NSMutableDictionary.h
//  SuperCoach
//
//  Created by 夜风 on 15/4/21.
//  Copyright (c) 2015年 Lin Feihong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Extension)

- (void)setOB:(id)anObject forKey:(NSString *)aKey;
- (void)safeSetObject:(id)anObject forKey:(NSString *)aKey;
@end
