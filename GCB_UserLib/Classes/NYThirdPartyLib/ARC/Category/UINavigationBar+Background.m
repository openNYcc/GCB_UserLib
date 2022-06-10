//
//  customNavigationBar.m
//  multiPass
//
//  Created by mac on 12-2-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UINavigationBar+Background.h"

@implementation UINavigationBar (Background)

- (void)setBackgroundWithImageName:(UIImage *)img belowImageName:(UIImage *)belowImg
{
    [self setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, BOLD_FONT(20), NSFontAttributeName, nil]];
}

@end

