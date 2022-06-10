//
//  HDWeakObject.h
//  Vehicular
//
//  Created by hufan on 2020/5/20.
//  Copyright © 2020 hufan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDWeakObject : NSObject

- (instancetype)initWithWeakObject:(nonnull id)obj;
+ (instancetype)proxyWithWeakObject:(nonnull id)obj;

@end

NS_ASSUME_NONNULL_END
