//
//  UIAlertView+Extension.m
//  TXZS_Communication
//
//  Created by 夜风 on 14-4-25.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

#import "UIAlertView+Extension.h"

@implementation UIAlertView (Extension)

+ (void)showWithMessage:(NSString *)message
{
    [self showWithTitle:@"提示" message:message delegate:nil tag:0];
}

+ (void)showWithMessage:(NSString *)message delegate:(id)delegate
{
    [self showWithTitle:@"提示" message:message delegate:delegate tag:0];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate
{
    [self showWithTitle:title message:message delegate:delegate tag:0];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate tag:(int)tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.tag = tag;
    [alertView show];
}

@end
