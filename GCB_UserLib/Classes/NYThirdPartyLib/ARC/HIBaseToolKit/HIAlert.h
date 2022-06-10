//
//  HIAlert.h
//  Expecta
//
//  Created by hufan on 2020/10/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HIAlert : NSObject

+ (void)alert:(NSString *)content;

+ (void)alert:(NSString *)content confirmHandler:(void (^ __nullable)(UIAlertAction *action))handler;

@end

NS_ASSUME_NONNULL_END
