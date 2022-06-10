//
//  UITextField+Addtion.m
//  TXZS_Communication
//
//  Created by 夜风 on 14-6-6.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

#import "UITextField+Addtion.h"
#import "NYPubLibImport.h"
@implementation UITextField (Addtion)

- (void)setupTextFieldRightView:(NSString *)imageName target:(id)target action:(SEL)action {
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:IMAGE(imageName) forState:UIControlStateNormal];
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    rightBtn.frame = CGRectMake(0, 0, 20, 20);
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self setRightViewMode:UITextFieldViewModeAlways];
    [self setRightView:rightBtn];
}

- (void)resetTextFieldRightView {
    [self setRightView:nil];
}

@end
