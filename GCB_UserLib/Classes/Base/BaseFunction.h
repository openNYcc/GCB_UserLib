//
//  BaseFunction.h
//  OfficialCarRentalUserProject
//
//  Created by 学鸿张 on 2017/11/16.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ModelManager.h"

@interface BaseFunction : NSObject
+ (NSString *)getAppShortVersion;
+ (NSString *)getAppVersion;
+ (CGSize)getLabelSize:(NSString *)str width:(NSInteger)width font:(UIFont *)font;
+ (CGSize)getLabelSize:(NSString *)str height:(NSInteger)height font:(UIFont *)font;
+ (BOOL)checkPhoneNum:(NSString *)text;
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

+ (BOOL)regexPostCode:(NSString *)postCode;
+ (BOOL)regexPhone:(NSString *)phone;
+ (NSAttributedString *)changeContentForChartAttributeString:(NSString *)string andKey:(NSString *)key andFirstColor:(UIColor *)firstColor andMiddleColor:(UIColor *)middleColor andLastColor:(UIColor *)lastColor andFirstFont:(UIFont *)firstFont andMiddleFont:(UIFont *)middleFont andLastFont:(UIFont *)lastFont;
+ (NSString *)hexStringFromString:(id)string;
+(NSString *)translation:(NSString *)arebic;
+ (NSString *)shuffledAlphabetAndWithType:(int)types andNums:(int)nums;
+ (NSString *)getCurrentTime;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringFromDateForMinite:(NSDate *)date;
+ (void)showToast:(NSString *)text;
+ (void)showToastAtWindow:(NSString *)text;
+ (NSString *)getNowDay;

+ (NSString *)getToday;
+ (NSString *)getHalfMonthAgo;
+ (NSString *)getNowTime;
+ (NSString *)getNowDate;
+ (NSString *)getYesterday;
+ (NSString *)getCurrentTwoDayAgo;
+ (NSString *)getThisMonth;
+ (NSString *)getOneMonthAgo;
+ (NSString *)getOneMonthAgoWithDate:(NSDate *)date n:(NSInteger)n;
+ (NSString *)getThisYear;
+ (NSString *)getOneYearAgo;
+ (NSString *)iphoneTyp;
+ (float)adjustFontSzieWithScreenScale:(float)fontSize;
+ (NSString *)createRandomNumber:(NSInteger)number;
+ (NSString *)timewithFormat:(float)times;
+ (NSString *)distanceWithFormat:(NSInteger)m;
+ (NSString *)timeWithFormat:(NSInteger)time;
+ (void)showLoading;
+ (void)hideLoading;
+ (NSString *)filterPhoneNum:(NSString *)phone;
+ (void)callByWebView:(NSString *)phone;
+ (NSInteger)compareDate:(NSDate *)starDate andEnd:(NSDate *)endDate;

+ (UITableViewCell *)loadTechnologicalProcessCellWithTracks:(NSArray *)tracksArray title:(NSString *)title  isShowGj:(BOOL)isShowGj target:(id)target action:(SEL)action orderNo:(NSString *)orderNo showTitle:(NSString *)showTitle;

+ (NSString *)getCarStringWithCars:(NSArray *)array;
+ (NSString *)getFileIconAccordingFileName:(NSString *)attachName;
+ (UITableViewCell *)loadForEnclosureCellWithArray:(NSArray *)enclosureArray target:(id)target action:(SEL)action action1:(SEL)action1;

+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage;




@end
