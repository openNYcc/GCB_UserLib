//
//  UIView+Addtion.h
//  91Market
//
//  Created by 夜风 on 14-5-27.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Addtion)

+ (id)loadFromNIB;
+ (id)loadFromNIBNamed:(NSString *)nibName;

- (void)setCornerRadius:(float)radius;
- (void)setBorderLineWithColor:(UIColor *)borderColor;
- (void)setBorderLineWithColor:(UIColor *)borderColor pixel:(CGFloat)pixel;
+ (UIView *)setupLineView:(CGRect)frame bgColor:(UIColor *)bgColor;
@end
