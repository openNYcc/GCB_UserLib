//
//  UILabel+Label.h
//  soshow.org
//
//  Created by Users on 13-9-2.
//  Copyright (c) 2013年 sos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Label)

+ (UILabel *)frame:(CGRect)frame name:(NSString *)name size:(CGFloat)fontSize andTextColor:(UIColor *)color textAlignment:(NSInteger)textAlignment;
+ (UILabel *)frame:(CGRect)frame name:(NSString *)name size:(CGFloat)fontSize andTextColor:(UIColor *)color bgColor:(UIColor *)bgColor textAlignment:(NSInteger)textAlignment;
+ (UILabel *)frame:(CGRect)frame name:(NSString *)name size:(CGFloat)fontSize andTextColor:(UIColor *)color bgColor:(UIColor *)bgColor textAlignment:(NSInteger)textAlignment tag:(int)tag;
+ (UILabel *)frame:(CGRect)frame name:(NSString *)name size:(CGFloat)fontSize andTextColor:(UIColor *)color;
+ (UILabel *)llframe:(CGRect)frame name:(NSString *)name size:(UIFont *)fontSize andTextColor:(UIColor *)color andTextAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)frame:(CGRect)frame name:(NSString *)name size:(CGFloat)fontSize andTextColor:(UIColor *)color bgColor:(UIColor *)bgColor tag:(int)tag;
+ (UILabel *)frame:(CGRect)frame WhiteName:(NSString *)name size:(CGFloat)fontSize;
+ (UILabel *)llframe:(CGRect)frame name:(NSString *)name size:(UIFont *)fontSize andTextColor:(UIColor *)color andTextAlignment:(NSTextAlignment)textAlignment andNumberOfLines:(NSInteger)numberOfLines;
@end
