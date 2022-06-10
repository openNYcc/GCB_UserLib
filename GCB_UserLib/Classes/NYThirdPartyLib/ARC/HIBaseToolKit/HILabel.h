//
//  HILabel.h
//  Vehicular
//
//  可以纵向居中的label
//
//  Created by hufan on 2020/5/14.
//  Copyright © 2020 Yelena. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    HIVerticalAlignmentTop = 0, // default
    HIVerticalAlignmentCenter,
    HIVerticalAlignmentBottom,
} HIVerticalAlignment;


NS_ASSUME_NONNULL_BEGIN

@interface HILabel : UILabel
@property (nonatomic) HIVerticalAlignment verticalAlignment;
@end

NS_ASSUME_NONNULL_END
