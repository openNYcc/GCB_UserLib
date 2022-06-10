//
//  UIButton+AsyncImage.h
//  FJ_FlowManager_3.0
//
//  Created by Johnny on 14/11/25.
//  Copyright (c) 2014年 FN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AsyncImage)

- (void)setImageFromURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage;

- (void)setImageFromURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage completion:(void (^)(void))completion;

+ (UIButton *)frameWithFrame:(CGRect)frame andTitle:(NSString *)title andFont:(CGFloat)font andTarget:(id)target andAction:(SEL)action;

+ (UIButton *)frameWithFrame:(CGRect)frame andImage:(NSString *)image andHighlightedImage:(NSString *)highlightedImafe andTarget:(id)target andAction:(SEL)action;

@end
