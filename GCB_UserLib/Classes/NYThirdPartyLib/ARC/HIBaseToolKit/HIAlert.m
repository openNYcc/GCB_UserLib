//
//  HIAlert.m
//  Expecta
//
//  Created by hufan on 2020/10/29.
//

#import "HIAlert.h"

@implementation HIAlert

+ (void)alert:(NSString *)content{
    [self alertWithTitle:@"提示" content:content];
}

+ (void)alertWithTitle:(NSString *)title content:(NSString *)content {
    [self alert:title content:content cancel:@"取消" confirm:@"确定" cancelHandler:nil confirmHandler:nil];
}

+ (void)alert:(NSString *)content confirmHandler:(void (^ __nullable)(UIAlertAction *action))handler{
    [self alert:@"提示" content:content cancel:@"取消" confirm:@"确定" cancelHandler:nil confirmHandler:handler];
}

+ (void)alert:(NSString *)title content:(NSString *)content cancel:(NSString *)cancel confirm:(NSString *)confirm
cancelHandler:(void (^ __nullable)(UIAlertAction *action))cancelHandler confirmHandler:(void (^ __nullable)(UIAlertAction *action))confirmHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
     
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:cancelHandler];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDestructive handler:confirmHandler];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    UIViewController *base = [[UIApplication sharedApplication] keyWindow].rootViewController;
    [base presentViewController:alertController animated:YES completion:nil];
}

@end
