//
//  UIView+Toast.h
//  FlowManager
//
//  Created by Johnny on 14-10-11.
//  Copyright (c) 2014年 FN. All rights reserved.
//

#import <UIKit/UIKit.h>

// display duration and position
static const CGFloat CSToastDefaultDuration     = 2;
static const NSString * CSToastDefaultPosition  = @"bottom";

@interface UIView (Toast)

- (void)makeToast:(NSString *)message;
- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title;
- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title image:(UIImage *)image;
- (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position image:(UIImage *)image;

// displays toast with an activity spinner
- (void)makeToastActivity;
- (void)makeToastActivityWithToash:(NSString *)message;
//- (void)makeToastActivity:(id)position;
- (void)hideToastActivity;
- (void)hideToastActivityFromWebView;

// the showToast methods display any view as toast
- (void)showToast:(UIView *)toast;
- (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(id)point;

@end
