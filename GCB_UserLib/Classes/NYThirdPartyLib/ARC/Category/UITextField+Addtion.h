//
//  UITextField+Addtion.h
//  TXZS_Communication
//
//  Created by 夜风 on 14-6-6.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Addtion)

- (void)setupTextFieldRightView:(NSString *)imageName target:(id)target action:(SEL)action;
- (void)resetTextFieldRightView;

@end
