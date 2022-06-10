//
//  UIAlertView+Extension.h
//  TXZS_Communication
//
//  Created by 夜风 on 14-4-25.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

@interface UIAlertView (Extension)

+ (void)showWithMessage:(NSString *)message;
+ (void)showWithMessage:(NSString *)message delegate:(id)delegate;
+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate;
+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate tag:(int)tag;

@end
