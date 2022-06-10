//
//  UIView+Addtion.m
//  91Market
//
//  Created by 夜风 on 14-5-27.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@implementation UIView (NIB)

+ (NSString*)nibName {
    return [self description];
}

+ (id)loadFromNIB {
    NSString *nibName = [self nibName];
    return [self loadFromNIBNamed:nibName];
}

+ (id)loadFromNIBNamed:(NSString *)nibName {
    Class klass = [self class];
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for (id object in objects) {
        if ([object isKindOfClass:klass]) {
            return object;
        }
    }
    [NSException raise:@"WrongNibFormat" format:@"Nib for '%@' must contain one UIView, and its class must be '%@'", nibName, NSStringFromClass(klass)];
    return nil;
}

- (void)setCornerRadius:(float)radius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)setBorderLineWithColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)setBorderLineWithColor:(UIColor *)borderColor pixel:(CGFloat)pixel {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = pixel;
}
+ (UIView *)setupLineView:(CGRect)frame bgColor:(UIColor *)bgColor
{
    UIView *lineView = [[UIView alloc] initWithFrame:frame];
    lineView.backgroundColor = bgColor;
    return lineView;
}
@end
