//
//  NSArray+Extension.m
//  TXZS_Communication
//
//  Created by 夜风 on 14-4-25.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

//按key索引正向排序数据
- (NSArray *)enumeratorArrayWithOneDescriptorsKey:(NSString *)key {
    NSArray *sortedResult = nil;
    if (key != nil && key.length > 0) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
        NSMutableArray *sortDescriptors = [[NSMutableArray alloc] initWithObjects:&sortDescriptor count:1];
        sortedResult = [self sortedArrayUsingDescriptors:sortDescriptors];
        NSEnumerator *enumerator = [sortedResult objectEnumerator];
        sortedResult = [NSArray arrayWithArray:[enumerator allObjects]];
    }
    return sortedResult;
}

//按key索引反向排序数据
- (NSArray *)reverseEnumeratorArrayWithOneDescriptorsKey:(NSString *)key {
    NSArray *sortedResult = nil;
    if (key != nil && key.length > 0) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
        NSMutableArray *sortDescriptors = [[NSMutableArray alloc] initWithObjects:&sortDescriptor count:1];
        sortedResult = [self sortedArrayUsingDescriptors:sortDescriptors];
        NSEnumerator *reverseEnumerator = [sortedResult reverseObjectEnumerator];
        sortedResult = [NSArray arrayWithArray:[reverseEnumerator allObjects]];
    }
    return sortedResult;
}
- (id)safeQueryObjectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}
@end
