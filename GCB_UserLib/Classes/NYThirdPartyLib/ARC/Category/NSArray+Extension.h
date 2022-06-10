//
//  NSArray+Extension.h
//  TXZS_Communication
//
//  Created by 夜风 on 14-4-25.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

@interface NSArray (Extension)

- (NSArray *)enumeratorArrayWithOneDescriptorsKey:(NSString *)key;
- (NSArray *)reverseEnumeratorArrayWithOneDescriptorsKey:(NSString *)key;
- (id)safeQueryObjectAtIndex:(NSInteger)index;
@end
