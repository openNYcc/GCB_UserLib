//
//  UIButton+AsyncImage.m
//  FJ_FlowManager_3.0
//
//  Created by Johnny on 14/11/25.
//  Copyright (c) 2014年 FN. All rights reserved.
//

#import "UIButton+AsyncImage.h"
#import "NYPubLibImport.h"

@implementation UIButton (AsyncImage)

- (void)setImageFromURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage completion:(void (^)(void))completion {
    [self setImage:placeholderImage forState:state];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = nil;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        image = [UIImage imageWithData:data];
        if (image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setImage:image forState:state];
                completion();
            });
        }
        else {
//            NSLog(@"async load error.");
        }
    });
}

- (void)setImageFromURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage {
    [self setImage:placeholderImage forState:state];
    if ([[NSUserDefaults standardUserDefaults] dataForKey:url]) {
        [self setImage:[UIImage imageWithData:[[NSUserDefaults standardUserDefaults] dataForKey:url]] forState:state];
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSUserDefaults standardUserDefaults] setObject:data forKey:url];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [self setImage:image forState:state];
                });
            }
            else {
    //            NSLog(@"async load error.");
            }
        });
    }
}
+ (UIButton *)frameWithFrame:(CGRect)frame andImage:(NSString *)image andHighlightedImage:(NSString *)highlightedImafe  andTarget:(id)target andAction:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:IMAGE(image) forState:UIControlStateNormal];
    [btn setBackgroundImage:IMAGE(highlightedImafe) forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+ (UIButton *)frameWithFrame:(CGRect)frame andTitle:(NSString *)title andFont:(CGFloat)font andTarget:(id)target andAction:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    if(action){
         [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
   
    return btn;
}














@end
