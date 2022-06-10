//
//  BaseFunction.m
//  OfficialCarRentalUserProject
//
//  Created by 学鸿张 on 2017/11/16.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import "BaseFunction.h"
#include <sys/socket.h> //MAC
#include <sys/sysctl.h>
#include <sys/stat.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <sys/utsname.h>
#import "NYPubLibImport.h"

@class AppDelegate;

@implementation BaseFunction
+ (NSString *)getAppShortVersion
{
    return [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
}

+ (NSString *)getAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
#pragma mark - 获得字符串长度
+ (CGSize)getLabelSize:(NSString *)str width:(NSInteger)width font:(UIFont *)font
{
    NSArray *arry = [str componentsSeparatedByString:@"\n"];
    float sy = 0;
    float sx = 0;
    for (NSString *str in arry) {
        NSString *t = str;
        if ([t isEqualToString:@""]) {
            t = @" ";
        }
        NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        CGSize detailSize = [t boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrDic context:nil].size;
        sy += detailSize.height;
        sx = detailSize.width;
    }
    
    return CGSizeMake(sx, ceilf(sy));
}

+ (CGSize)getLabelSize:(NSString *)str height:(NSInteger)height font:(UIFont *)font
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle,NSParagraphStyleAttributeName,nil];
    CGSize size = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrDic context:nil].size;
    return size;
}

+ (BOOL)checkPhoneNum:(NSString *)text
{
    NSString *Regex =@"(13[0-9]|14[57]|15[012356789]|18[012356789]|17[012356789])\\d{8}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [mobileTest evaluateWithObject:text];
}
// 身份证号验证
+ (BOOL)validateIdentityCard:(NSString *)identityCard {
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//匹配邮编
+ (BOOL)regexPostCode:(NSString *)postCode
{
    NSString *regex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:postCode];
    return isValid;
}

//匹配手机号
+ (BOOL)regexPhone:(NSString *)phone
{
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:phone];
    return isValid;
}

+ (NSAttributedString *)changeContentForChartAttributeString:(NSString *)string andKey:(NSString *)key andFirstColor:(UIColor *)firstColor andMiddleColor:(UIColor *)middleColor andLastColor:(UIColor *)lastColor andFirstFont:(UIFont *)firstFont andMiddleFont:(UIFont *)middleFont andLastFont:(UIFont *)lastFont
{
    NSMutableAttributedString *attring = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:key];
    if(range.location == NSNotFound){
        return attring;
    }
    
    [attring addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:firstColor, NSForegroundColorAttributeName, firstFont, NSFontAttributeName, nil] range:NSMakeRange(0, range.location)];
    
    [attring addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:middleColor, NSForegroundColorAttributeName, middleFont, NSFontAttributeName, nil] range:NSMakeRange(range.location, range.length)];
    
    
    [attring addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:lastColor, NSForegroundColorAttributeName, lastFont, NSFontAttributeName, nil] range:NSMakeRange(range.location + range.length, string.length - range.location - range.length)];
    return attring;
}

//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(id)string
{
    NSData *myD = nil;
    if ([string isKindOfClass:[NSString class]]) {
        myD =
        [string dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];;
    }
    else
        myD = string;
    
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

//阿拉伯数字转化为汉语数字
+(NSString *)translation:(NSString *)arebic
{
    NSString *str = arebic;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    NSLog(@"%@",str);
    NSLog(@"%@",chinese);
    return chinese;
}

//生成32位以下的随机字符串
+ (NSString *)shuffledAlphabetAndWithType:(int)types andNums:(int)nums {
    NSString *alphabet;
    if(types == 0){
        alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    }else{
        alphabet = @"12345678901234561234567890123456";
    }
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform((float)numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result;
    if(nums == 0){
        result = [NSString stringWithCharacters:characters length:16];
    }else{
        result = [NSString stringWithCharacters:characters length:nums];
    }
    
    free(characters);
    return result;
}
+ (NSString *)getCurrentTime
{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}
+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter*df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [df stringFromDate:date];
    return dateStr;
}
+ (NSString *)stringFromDateForMinite:(NSDate *)date
{
    NSDateFormatter*df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [df stringFromDate:date];
    return dateStr;
}
+ (NSInteger)compareDate:(NSDate *)starDate andEnd:(NSDate *)endDate
{
    NSInteger result = 0;
    NSString *starTime = [starDate stringFromDate:starDate];
    NSString *endTime = [endDate stringFromDate:endDate];
    NSDate *resultStarDate = [starDate dateFromString:starTime];
    NSDate *resultEndDate = [endDate dateFromString:endTime];
    if([resultStarDate isEqualToDate:resultEndDate]){
        result = 0;
    }
    else if([resultEndDate timeIntervalSinceDate:resultStarDate] > 0){
        result = 1;
    }
    else{
        result = -1;
    }
    
    return result;
}
+ (void)showToast:(NSString *)text
{
//    AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view makeToast:text];
}

+ (void)showToastAtWindow:(NSString *)text
{
    AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[UIApplication sharedApplication].keyWindow makeToast:text];
}

+ (NSString *)getNowDay {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    return [dateFormatter stringFromDate:now];
}
+ (NSString *)getNowTime
{
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMddhh";
    return [dateFormatter stringFromDate:now];
}
+ (NSString *)getNowDate
{
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd";
    return [dateFormatter stringFromDate:now];
}
+ (NSString *)getYesterday {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    NSDate *now = [NSDate date];
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags =
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:now];
    NSInteger day = [cps day];
    cps.day = day - 1;
    NSDate *lastMonthDate = [chineseClendar dateFromComponents:cps];
    return [dateFormatter stringFromDate:lastMonthDate];
}

+ (NSString *)getCurrentTwoDayAgo {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    NSDate *now = [NSDate date];
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags =
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:now];
    NSInteger day = [cps day];
    cps.day = day - 2;
    NSDate *lastMonthDate = [chineseClendar dateFromComponents:cps];
    return [dateFormatter stringFromDate:lastMonthDate];
}

+ (NSString *)getThisMonth {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMM";
    return [dateFormatter stringFromDate:now];
}
+ (NSString *)getToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter stringFromDate:now];
}
+ (NSString *)getHalfMonthAgo
{
    NSDate *now = [[NSDate date] dateByAddingSeconds:-3600 * 24 * 15];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter stringFromDate:now];
}
+ (NSString *)getOneMonthAgo {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMM";
    NSDate *now = [NSDate date];
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags =
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:now];
    NSInteger month = [cps month];
    cps.month = month - 1;
    NSDate *lastMonthDate = [chineseClendar dateFromComponents:cps];
    return [dateFormatter stringFromDate:lastMonthDate];
}

+ (NSString *)getOneMonthAgoWithDate:(NSDate *)date n:(NSInteger)n
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:-n];
    [adcomps setDay:0];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    return [dateFormatter stringFromDate:newdate];
}

+ (NSString *)getThisYear {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy";
    return [dateFormatter stringFromDate:now];
}

+ (NSString *)getOneYearAgo {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy";
    NSDate *now = [NSDate date];
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags =
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:now];
    NSInteger year = [cps year];
    cps.year = year-1;
    NSDate *lastMonthDate = [chineseClendar dateFromComponents:cps];
    return [dateFormatter stringFromDate:lastMonthDate];
}
+ (NSString *)iphoneType {
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
    
}
+ (float)adjustFontSzieWithScreenScale:(float)fontSize
{
    NSInteger adjustFontSize = 0;
    if ([[UIScreen mainScreen] scale] == 1) {
        adjustFontSize = fontSize;
    }else if ([[UIScreen mainScreen] scale] == 3) {
        adjustFontSize = fontSize;
    }else if ([[UIScreen mainScreen] scale] == 2) {
        adjustFontSize = fontSize;
    }else {
        adjustFontSize = fontSize;
    }
    return adjustFontSize;
}
+ (NSString *)createRandomNumber:(NSInteger)number
{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < number; i++) {
        int figure = arc4random() % 10;
        NSString *tempString = [NSString stringWithFormat:@"%d", figure];
        string = [string stringByAppendingString:tempString];
    }
    //        NSLog(@"%@", string);
    return string;
}

+ (NSString *)timewithFormat:(float)times{
    NSString *time = nil ;
    float _time = times/3600.0 ;
    if (_time == 0) {
        time = [NSString stringWithFormat:@"0.0 h"];
    } else if (((int)_time) < 10) {
        time = [NSString stringWithFormat:@"%.2f h",_time];
    } else if (((int)_time) < 100) {
        time = [NSString stringWithFormat:@"%.1f h",_time];
    } else {
        time = [NSString stringWithFormat:@"%.f h",_time];
    }
    
    return time ;
}

+ (NSString *)distanceWithFormat:(NSInteger)m
{
    NSString *dis;
    if (m>=1000) {
        dis = [NSString stringWithFormat:@"%.1f公里",m/1000.0 ];
    }else {
        dis = [NSString stringWithFormat:@"%ld米",m];
    }
    return dis;
}

+ (NSString *)timeWithFormat:(NSInteger)time
{
    NSString *timeStr;
    NSInteger h = time/3600;
    NSInteger m = (time-3600*h)/60;
    NSInteger s = time-3600*h-m*60;
    if (h > 0) {
        if (m > 0) {
            if (s > 0) {
                timeStr = [NSString stringWithFormat:@"%ld小时%ld分%ld秒", (long)h,(long)m,(long)s];
            }else {
                timeStr = [NSString stringWithFormat:@"%ld小时%ld分", (long)h,(long)m];
            }
        }else {
            if (s > 0) {
                timeStr = [NSString stringWithFormat:@"%ld小时%ld秒", (long)h,(long)s];
            }else {
                timeStr = [NSString stringWithFormat:@"%ld小时", (long)h];
            }
        }
    }else {
        if (m > 0) {
            if (s > 0) {
                timeStr = [NSString stringWithFormat:@"%ld分%ld秒",(long)m,(long)s];
            }else {
                timeStr = [NSString stringWithFormat:@"%ld分",(long)m];
            }
        }else {
            if (s > 0) {
                timeStr = [NSString stringWithFormat:@"%ld秒",(long)s];
            }
        }
    }
    
    return timeStr ;
}
+ (void)showLoading
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [[UIApplication sharedApplication].keyWindow  makeToastActivity];
}
+ (void)hideLoading
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [[UIApplication sharedApplication].keyWindow  hideToastActivity];
}

+ (NSString *)filterPhoneNum:(NSString *)phone
{
    NSRange range = [phone rangeOfString:@"+86"];
    if (range.location != NSNotFound) {
        phone = [phone substringFromIndex:(range.location + range.length)];
    }
    phone = [NSString stringWithFormat:@"tel://%@", phone];
    return phone;
}
+ (void)callByWebView:(NSString *)phone
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
}


//+ (UITableViewCell *)loadTechnologicalProcessCellWithTracks:(NSArray *)tracksArray title:(NSString *)title  isShowGj:(BOOL)isShowGj target:(id)target action:(SEL)action orderNo:(NSString *)orderNo  showTitle:(NSString *)showTitle
//{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellInfo"];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = [UIColor clearColor];
//
//
//    CGFloat offsetY = 0;
//    if(isShowGj){
//        offsetY = 50;
//    }
//
//    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:RECT(0, 0, SCR_WIDTH,0)];
//    bgImageView.image = IMAGE(@"va_order_bg_1");
//    [cell.contentView addSubview:bgImageView];
//
//
//
//    UILabel *nameLabel = [UILabel frame:RECT(25, 27, 150, 15) name:title size:16 andTextColor:HexRGB(0x000000)];
//    nameLabel.textAlignment = 0;
//   // [cell.contentView addSubview:nameLabel];
//
//    UIView *line = [[UIView alloc]initWithFrame:RECT(20, 49, SCR_WIDTH - 40, 1)];
//    line.backgroundColor = HexRGB(0xd2d0d0);
//    [cell.contentView addSubview:line];
//
////    if(tracksArray.count > 0){
////        //TaskTraksModel *model = tracksArray.firstObject;
////
////    }
////    else{
////        UILabel *titleLabel = [UILabel frame:RECT(25, line.top + line.height + 15, 170, 16) name:[NSString stringWithFormat:@"当前节点:%@",@"暂未派车"] size:16 andTextColor:HexRGB(0x000000)];
////        titleLabel.textAlignment = 0;
////        [cell.contentView addSubview:titleLabel];
////        titleLabel.attributedText = [BaseFunction changeContentForChartAttributeString:titleLabel.text andKey:@"暂未派车" andFirstColor:HexRGB(0x000000) andMiddleColor:HexRGB(0x0ff6565) andLastColor:HexRGB(0x000000) andFirstFont:FONT(16) andMiddleFont:FONT(16) andLastFont:FONT(16)];
////
////        UILabel *orderNumberLabel = [UILabel frame:RECT(SCR_WIDTH - 255, nameLabel.top, 220, 16) name:[NSString stringWithFormat:@"申请单号:%@",orderNo] size:15 andTextColor:HexRGB(0x747474)];
////        orderNumberLabel.textAlignment = 2;
////        [cell.contentView addSubview:orderNumberLabel];
////    }
//
//    UILabel *titleLabel = [UILabel frame:RECT(25, line.top + line.height + 15, 170, 16) name:[NSString stringWithFormat:@"当前节点:%@",showTitle] size:16 andTextColor:HexRGB(0x000000)];
//    titleLabel.textAlignment = 0;
//    [cell.contentView addSubview:titleLabel];
//    titleLabel.attributedText = [BaseFunction changeContentForChartAttributeString:titleLabel.text andKey:showTitle andFirstColor:HexRGB(0x000000) andMiddleColor:HexRGB(0x0ff6565) andLastColor:HexRGB(0x000000) andFirstFont:FONT(16) andMiddleFont:FONT(16) andLastFont:FONT(16)];
//
//    UILabel *orderNumberLabel = [UILabel frame:RECT(25, nameLabel.top, SCR_WIDTH - 50, 16) name:[NSString stringWithFormat:@"申请单号:%@",orderNo] size:15 andTextColor:HexRGB(0x747474)];
//    orderNumberLabel.textAlignment = 0;
//    [cell.contentView addSubview:orderNumberLabel];
//    orderNumberLabel.attributedText = [BaseFunction changeContentForChartAttributeString:orderNumberLabel.text andKey:orderNo andFirstColor:HexRGB(0x000000) andMiddleColor:HexRGB(0x747474) andLastColor:HexRGB(0x000000) andFirstFont:FONT(16) andMiddleFont:FONT(16) andLastFont:FONT(16)];
//    bgImageView.mj_h = titleLabel.bottom + 15;
//    CGFloat lineHeight = 0;
////    if(tracksArray.count > 0){
////        lineHeight = 85 * (tracksArray.count - 1);
////        if(tracksArray.count == 1){
////            lineHeight = 85;
////        }
////    }
//    if (tracksArray.count==0)
//    {
//        lineHeight = bgImageView.bottom;
//    }
//
//    UIView *lineOne = [[UIView alloc]initWithFrame:RECT(38, 110, 3, 0)];
//    lineOne.backgroundColor = HexRGB(0xE9E9E9);
//    [cell.contentView addSubview:lineOne];
//
//    for(int i = 0; i < tracksArray.count; i ++){
//        TaskTraksModel *model = tracksArray[i];
//        NSString *imageName = @"record_detail_schedule_icon1";
//        NSString *time = model.dealTime;
//        NSString *content = model.levelName;
//        NSString *remark = model.remark;
//        CGFloat offsexY = i==0? (lineOne.top +lineHeight-15):lineHeight;
//
//        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:RECT(32, offsexY, 15, 15)];
//        iconImageView.image = IMAGE(imageName);
//        [cell.contentView addSubview:iconImageView];
//
//
//        UILabel *timeLabel = [UILabel frame:RECT(54, iconImageView.top, 180, 15) name:time size:16 andTextColor:HexRGB(0x747474)];
//        timeLabel.textAlignment = 0;
//        [cell.contentView addSubview:timeLabel];
//
//        UILabel *contentLabel = [UILabel frame:RECT(54, iconImageView.top + 25, 350, 15) name:content size:16 andTextColor:HexRGB(0x010101)];
//        contentLabel.textAlignment = 0;
//        [cell.contentView addSubview:contentLabel];
//
//        CGFloat lineY = contentLabel.top + contentLabel.height + 13;
//        if (remark.length>0)
//        {
//            UILabel *contentRemLabel = [UILabel frame:RECT(54, contentLabel.top + 25,iPhoneX?300:330 , 32) name:remark size:13 andTextColor:UIColor.redColor];
//            contentRemLabel.numberOfLines = 0;
//            contentRemLabel.textAlignment = 0;
//            [cell.contentView addSubview:contentRemLabel];
//            lineY = contentRemLabel.top + contentRemLabel.height + 13;
//            lineHeight = CGRectGetMaxY(contentRemLabel.frame) + 10;
//        }
//        else
//        {
//            lineHeight = CGRectGetMaxY(contentLabel.frame) + 20;
//        }
//
//        UIView *line = [[UIView alloc]initWithFrame:RECT(54, lineY, SCR_WIDTH - 54 - 39, 1)];
//        line.backgroundColor = HexRGB(0xe9e9e9);
//        if(i != tracksArray.count - 1){
//            [cell.contentView addSubview:line];
//            lineHeight = CGRectGetMaxY(line.frame)+5;
//        }
//        else
//        {
//            lineOne.mj_h = iconImageView.top - lineOne.top;
//        }
//    }
//
//
//    if(isShowGj){
//        CGFloat offsexY = lineHeight + 10;
//        CGFloat scale = SCR_WIDTH/375;
//        CGFloat btnWidth = 271 * scale;
//        CGFloat btnHeight = 37;
//        UIButton *btn = [UIButton frameWithFrame:RECT((SCR_WIDTH - btnWidth)/2, offsexY, btnWidth, btnHeight) andTitle:@"轨迹回放" andFont:17 andTarget:target andAction:action];
//        btn.tag = 10086;
//        [btn setBackgroundImage:IMAGE(@"record_detail_btn_navigation") forState:UIControlStateNormal];
//        [btn setTitleColor:HexRGB(0xf6683c) forState:UIControlStateNormal];
//        [cell.contentView addSubview:btn];
//        lineHeight = CGRectGetMaxY(btn.frame)+15;
//    }
//
//    bgImageView.mj_h = lineHeight;
//    ((BaseViewController *)target).evaluateCellH = lineHeight+5;
//    return cell;
//}


//+ (NSString *)getCarStringWithCars:(NSArray *)array
//{
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    for(TaskCarModel *model in array){
//        if([dic.allKeys containsObject:model.carType]){
//            NSMutableDictionary *dictionry = [dic valueForKey:model.carType];
//            NSInteger count = [[dictionry valueForKey:@"count"] integerValue];
//            [dictionry setValue:[NSString stringWithFormat:@"%ld",count + 1] forKey:@"count"];
//        }
//        else{
//            NSMutableDictionary *dictionry = [NSMutableDictionary dictionary];
//            if(!model.carType){
//                continue;
//            }
//            [dictionry setValue:model.carType forKey:@"carType"];
//            [dictionry setValue:@"1" forKey:@"count"];
//            [dic setValue:dictionry forKey:model.carType];
//        }
//        
//    }
//    
//    NSString *introStr = @"";
//    for(int i = 0; i <  dic.allKeys.count; i ++){
//        NSString *key = dic.allKeys[i];
//        NSDictionary *dictionary = [dic valueForKey:key];
//        NSString *carType = [dictionary valueForKey:@"carType"];
//        NSString *count = [dictionary valueForKey:@"count"];
//        CarTypeModel *typeModel = [USER_MANAGER getCarTypeModelWithState:carType];
//        if(i == 0){
//            
//            introStr = [introStr stringByAppendingFormat:@"%@%@辆",typeModel.name,count];
//        }
//        else{
//            introStr = [introStr stringByAppendingFormat:@",%@%@辆",typeModel.name,count];
//        }
//    }
//    
//    return introStr;
//    
//}
//
//+ (NSString *)getFileIconAccordingFileName:(NSString *)attachName
//{
//    NSString *icomImageName = @"nf_other_file";
//    if([attachName hasSuffix:@".doc"] || [attachName hasSuffix:@".docx"]){
//        icomImageName = @"nf_word";
//    }
//    else if([attachName hasSuffix:@".xls"] || [attachName hasSuffix:@".xlsx"]){
//        icomImageName = @"nf_excel";
//    }
//    else if([attachName hasSuffix:@".png"] || [attachName hasSuffix:@".jpg"] || [attachName hasSuffix:@".jpeg"]){
//        icomImageName = @"nf_picture";
//    }
//    return icomImageName;
//}
//+ (UITableViewCell *)loadForEnclosureCellWithArray:(NSArray *)enclosureArray target:(id)target action:(SEL)action action1:(SEL)action1
//{
//    NSString *info = @"info";
//    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:info];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = [UIColor clearColor];
//    
//    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:RECT(0, 0, SCR_WIDTH, 180)];
//    bgImageView.image = IMAGE(@"nf_file_bg");
//    [cell.contentView addSubview:bgImageView];
//    
//    UILabel *titleLabel = [UILabel frame:RECT(23, 25, 100, 16) name:@"附件" size:15 andTextColor:[UIColor blackColor]];
//    [cell.contentView addSubview:titleLabel];
//    titleLabel.textAlignment = 0;
//    
//    if(enclosureArray.count == 0){
//        
//        UIImageView *fileImageView = [[UIImageView alloc]initWithFrame:RECT((SCR_WIDTH - 106)/2, 50, 106, 72)];
//        fileImageView.image = IMAGE(@"nf_no_file");
//        [cell.contentView addSubview:fileImageView];
//        
//        UILabel *contentLabel = [UILabel frame:RECT(50, fileImageView.top + fileImageView.height + 12, SCR_WIDTH - 100, 15) name:@"暂无相关附件" size:14 andTextColor:HexRGB(0xb2b2b2)];
//        [cell.contentView addSubview:contentLabel];
//        
//    }
//    else if(enclosureArray.count == 1){
//        AttachModel *model = [enclosureArray firstObject];
//        NSString *icomImageName = [BaseFunction getFileIconAccordingFileName:model.attachName];
//        bgImageView.height = 130;
//        
//        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:RECT(29, 60, 17, 17)];
//        iconImageView.image = IMAGE(icomImageName);
//        [cell.contentView addSubview:iconImageView];
//        
//        
//        UILabel *contentLabel = [UILabel frame:RECT(50, 60, SCR_WIDTH - 76, 15) name:model.attachName size:17 andTextColor:HexRGB(0x2892ff)];
//        [cell.contentView addSubview:contentLabel];
//        contentLabel.textAlignment = 0;
//        contentLabel.numberOfLines = 0;
//        
//        CGSize size = [BaseFunction getLabelSize:contentLabel.text width:contentLabel.width font:contentLabel.font];
//        contentLabel.height = size.height;
//        
//        
//        UIButton *btn = [UIButton frameWithFrame:RECT(0, 40, SCR_WIDTH, 60) andTitle:@"" andFont:12 andTarget:target andAction:action1];
//        [cell.contentView addSubview:btn];
//    }
//    else{
//        AttachModel *model = [enclosureArray firstObject];
//        NSString *icomImageName = [BaseFunction getFileIconAccordingFileName:model.attachName];
//        bgImageView.height = 180;
//        
//        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:RECT(29, 60, 17, 17)];
//        iconImageView.image = IMAGE(icomImageName);
//        [cell.contentView addSubview:iconImageView];
//        
//        UILabel *contentLabel = [UILabel frame:RECT(50, 60, SCR_WIDTH - 76, 15) name:model.attachName size:17 andTextColor:HexRGB(0x2892ff)];
//        [cell.contentView addSubview:contentLabel];
//        contentLabel.textAlignment = 0;
//        contentLabel.numberOfLines = 0;
//        
//        CGSize size = [BaseFunction getLabelSize:contentLabel.text width:contentLabel.width font:contentLabel.font];
//        contentLabel.height = size.height;
//        
//        UIButton *btn = [UIButton frameWithFrame:RECT(0, 40, SCR_WIDTH, 30) andTitle:@"" andFont:12 andTarget:target andAction:action1];
//        [cell.contentView addSubview:btn];
//        
//        UIButton *showMoreBtn = [UIButton frameWithFrame:RECT(75,contentLabel.top + contentLabel.height + 20 , SCR_WIDTH - 150, 60) andTitle:@"" andFont:12 andTarget:target andAction:action];
//        [cell.contentView addSubview:showMoreBtn];
//        
//        UILabel *checkLabel = [UILabel frame:RECT(50, contentLabel.top + contentLabel.height + 20, SCR_WIDTH - 100, 17) name:@"点击查看更多附件" size:17 andTextColor:HexRGB(0x747474)];
//        [cell.contentView addSubview:checkLabel];
//        
//        
//        
//        UIImageView *showImageView = [[UIImageView alloc]initWithFrame:RECT((SCR_WIDTH - 15)/2, checkLabel.top + checkLabel.height + 6, 15, 15)];
//        showImageView.image = IMAGE(@"record_detail_down");
//        [cell.contentView addSubview:showImageView];
//        
//        
//    }
//    
//    return cell;
//}

+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage
{
    //进行图像尺寸的压缩
    CGSize imageSize = sourceImage.size;//取出要压缩的image尺寸
    CGFloat width = imageSize.width;    //图片宽度
    CGFloat height = imageSize.height;  //图片高度
    //1.宽高大于1280(宽高比不按照2来算，按照1来算)
    if (width>1280||height>1280) {
        if (width>height) {
            CGFloat scale = height/width;
            width = 1280;
            height = width*scale;
        }else{
            CGFloat scale = width/height;
            height = 1280;
            width = height*scale;
        }
        //2.宽大于1280高小于1280
    }else if(width>1280||height<1280){
        CGFloat scale = height/width;
        width = 1280;
        height = width*scale;
        //3.宽小于1280高大于1280
    }else if(width<1280||height>1280){
        CGFloat scale = width/height;
        height = 1280;
        width = height*scale;
        //4.宽高都小于1280
    }else{
    }
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImage drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //进行图像的画面质量压缩
    NSData *data=UIImageJPEGRepresentation(newImage, 1.0);
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(newImage, 0.7);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(newImage, 0.8);
        }else if (data.length>200*1024) {
            //0.25M-0.5M
            data=UIImageJPEGRepresentation(newImage, 0.9);
        }
    }
    return data;
}




@end
