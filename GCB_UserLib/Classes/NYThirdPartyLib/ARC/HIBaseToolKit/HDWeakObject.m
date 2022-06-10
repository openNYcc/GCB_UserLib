//
//  HDWeakObject.m
//  Vehicular
//
//  Created by hufan on 2020/5/20.
//  Copyright © 2020 hufan. All rights reserved.
//

#import "HDWeakObject.h"

@interface HDWeakObject ()

 @property (weak, nonatomic) id weakObject;

@end

@implementation HDWeakObject

- (instancetype)initWithWeakObject:(nonnull id)obj {
    _weakObject = obj;
    return self;
}

+ (instancetype)proxyWithWeakObject:(nonnull id)obj {
    return [[HDWeakObject alloc] initWithWeakObject:obj];
}

/**
 * 消息转发，让_weakObject响应事件
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _weakObject;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [invocation setReturnValue:&null];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_weakObject respondsToSelector:aSelector];
}


@end
