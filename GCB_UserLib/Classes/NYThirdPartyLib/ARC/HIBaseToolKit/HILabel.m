//
//  HILabel.m
//  Vehicular
//
//  Created by hufan on 2020/5/14.
//  Copyright © 2020 Yelena. All rights reserved.
//

#import "HILabel.h"

@interface HILabel (){
    
}

@end

@implementation HILabel

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = HIVerticalAlignmentCenter;
    }
    return self;
}
 
- (void)setVerticalAlignment:(HIVerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}
 
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case HIVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case HIVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case HIVerticalAlignmentCenter:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}
 
-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

@end
