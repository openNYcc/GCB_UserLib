//
//  UIImage+Expand.h
//  HealthaAides
//
//  Created by mac on 13-1-15.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Expand)

+ (UIImage *)shrinkImage:(UIImage *)original reSize:(CGSize)size;
+ (UIImage *)circleImage:(UIImage *)image inset:(CGFloat)inset lineColor:(UIColor *)lineColor;
+ (UIImage *)imageNamed:(NSString *)name withSize:(CGSize)newsize;
+ (UIImage *)imageNamed:(NSString *)name left:(NSInteger)left top:(NSInteger)top;

+ (UIImage *)imageWithColor:(UIColor *)color;
@end
