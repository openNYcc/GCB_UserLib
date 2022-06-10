//
//  UIImageView.m
//  FJ_MobileBusinessHall
//
//  Created by linfeihong on 2017/4/3.
//  Copyright © 2017年 FN. All rights reserved.
//

#import "UIImageView+Expand.h"
#import "NYPubLibImport.h"
@implementation UIImageView (Expand)

+ (UIImageView *)setupImageView:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = IMAGE(imageName);
    return imageView;
}

@end
