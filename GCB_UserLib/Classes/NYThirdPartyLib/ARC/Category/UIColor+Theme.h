//
//  UIColor+Theme.h
//  Tool
//
//  Created by lfh on 14-2-8.
//  Copyright (c) 2014年 BD91. All rights reserved.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#undef	RGB
#define RGB(R,G,B) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef	RGBA
#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#undef	HEX_RGB
#define HEX_RGB(V) [UIColor fromHexValue:V]

#undef	HEX_RGBA
#define HEX_RGBA(V, A) [UIColor fromHexValue:V alpha:A]

#undef	SHORT_RGB
#define SHORT_RGB(V) [UIColor fromShortHexValue:V]

@interface UIColor (Theme)

+ (UIColor *)fromHexValue:(NSUInteger)hex;
+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)fromShortHexValue:(NSUInteger)hex;
+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithString:(NSString *)string; // {#FFF|#FFFFFF|#FFFFFFFF}{,0.6}

@end

#endif
