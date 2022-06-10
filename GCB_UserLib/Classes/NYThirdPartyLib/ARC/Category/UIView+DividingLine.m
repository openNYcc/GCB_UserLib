//
//  UIView+DividingLine.m
//  BaminLife
//
//  Created by xuyonghua on 2017/8/13.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import "UIView+DividingLine.h"
#import "NYPubLibImport.h"
@implementation UIView (DividingLine)

- (void)setViewDivingLineH:(CGFloat)height andTopLineY:(CGFloat)value{
    UIView *topLine = [[UIView alloc] initWithFrame:RECT(0, value, SCR_WIDTH, 0.5)];
    topLine.backgroundColor = STD6_DIVIDING_LINE_COLOR;
    [self addSubview:topLine];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:RECT(0, height - 0.5, SCR_WIDTH, 0.5)];
    bottomLine.backgroundColor = STD6_DIVIDING_LINE_COLOR;
    [self addSubview:bottomLine];
}

@end
