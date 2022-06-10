//
//  PublicMacro.h
//  NewDemo
//
//  Created by 夜风 on 14/12/20.
//  Copyright (c) 2014年 Lin Feihong. All rights reserved.
//


#ifndef PublicMacro_h
#define PublicMacro_h


#pragma mark - release
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }
#define CF_RELEASE_SAFELY(__POINTER) { CFRelease(__POINTER); __POINTER = nil; }

#pragma mark - delegate
#define DELEGATE_CALLBACK(DELEGATE, SEL) if (DELEGATE && [DELEGATE respondsToSelector:@selector(SEL)]) [DELEGATE performSelector:@selector(SEL)]
#define DELEGATE_CALLBACK_ONE_PARAMETER(DELEGATE, SEL, X) if (DELEGATE && [DELEGATE respondsToSelector:@selector(SEL)]) [DELEGATE performSelector:@selector(SEL) withObject:X]
#define DELEGATE_CALLBACK_TWO_PARAMETER(DELEGATE, SEL, X, Y) if (DELEGATE && [DELEGATE respondsToSelector:@selector(SEL)]) [DELEGATE performSelector:@selector(SEL) withObject:X withObject:Y]

#pragma mark - LOG
#ifdef DEBUG
#define FNLOG(FORMAT, ...) fprintf(stderr, "\n====================================================================\n‖ 文件名称：%s \n‖ 方法名称:%s \n‖ LINE:%li \n‖ MESSAGE:\n  %s\n====================================================================\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __PRETTY_FUNCTION__, (long)__LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define FNLOG(...)
#endif

#pragma mark - Frame
#define SCR_WIDTH                  [UIScreen mainScreen].bounds.size.width
#define SCR_HEIGHT                 [UIScreen mainScreen].bounds.size.height
#define SCR_BOUNDS                 [UIScreen mainScreen].bounds
#define SIZE(w, h)                 CGSizeMake(w, h)
#define POINT(x, y)                CGPointMake(x, y)
#define RECT(x, y, w, h)           CGRectMake(x, y, w, h)

#pragma mark - Font
#define FONT(SIZE)                 [UIFont systemFontOfSize:SIZE]
#define BOLD_FONT(SIZE)            [UIFont boldSystemFontOfSize:SIZE]

#pragma mark - 6.0Adjust
#define UILineBreakMode					NSLineBreakMode
#define UILineBreakModeWordWrap			NSLineBreakByWordWrapping
#define UILineBreakModeCharacterWrap	NSLineBreakByCharWrapping
#define UILineBreakModeClip				NSLineBreakByClipping
#define UILineBreakModeHeadTruncation	NSLineBreakByTruncatingHead
#define UILineBreakModeTailTruncation	NSLineBreakByTruncatingTail
#define UILineBreakModeMiddleTruncation	NSLineBreakByTruncatingMiddle
#define UITextAlignmentLeft				NSTextAlignmentLeft
#define UITextAlignmentCenter			NSTextAlignmentCenter
#define UITextAlignmentRight			NSTextAlignmentRight
#define	UITextAlignment					NSTextAlignment

#pragma mark - 系统版本
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]
#define IOS10_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
#define IOS9_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)
#define IOS8_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define IOS7_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define IOS6_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
#define IOS5_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 5.0)
#define IOS4_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 4.0)
#define IOS3_OR_LATER ([[UIDevice currentDevice].systemVersion floatValue] >= 3.0)

#pragma mark - 屏幕宽高
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_Big ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_plus_Big ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark - Function
#define APP_DELEGATE               ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define USER_DEFAULTS              [NSUserDefaults standardUserDefaults]
#define SHARED_APP                 [UIApplication sharedApplication]
#define FILE_MAN                   [NSFileManager defaultManager]
#define BUNDLE                     [NSBundle mainBundle]
#define RESOURCE_PAHT(name)        [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name]
#define NOTI_CENTER                [NSNotificationCenter defaultCenter]
#define IMAGE(name)                [UIImage imageNamed:name]
#define APP_SHORT_VERSION          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define APP_VERSION                [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define COLOR(colorString) [UIColor colorWithString:colorString]

#define NSSTRING_OBJECT(object) [NSString stringWithFormat:@"%@", object]
#define NSSTRING_NUM(num) [NSString stringWithFormat:@"%ld", (long)num]
#define NSARRAY(ary) [[NSArray alloc] initWithArray:ary]
#define NSMUTABLEARRAY(ary) [NSMutableArray arrayWithArray:ary]
#define NSDICTIONARY(dic) [[NSDictionary alloc] initWithDictionary:dic]
#define NSMUTABLEDICTIONARY(dic) [NSMutableDictionary dictionaryWithDictionary:dic]

#pragma mark - Color
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)/1.0f]
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

#pragma mark - Private
#define TOP_HEIGHT (STATUS_BAR_HEIGHT + NAV_HEIGHT)
#define NAV_HEIGHT 44
#define TAB_BAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

#define RED_COLOR_1 @"#DB4442"
#define RED_COLOR_2 @"#f26b61"
#define RED_COLOR_3 @"#EC4D43"
#define BLUE_COLOR_1 @"#4FBEE8"
#define BLUE_COLOR_2 @"#E9F8FE"
#define BLUE_COLOR_3 @"#CFE9F5"
#define BLUE_COLOR_4 @"#6EACFC"
#define BLUE_COLOR_5 @"#22C6F0"
#define YELLOW_COLOR_1 @"#fdb000"
#define YELLOW_COLOR_2 @"#FEEC31"
#define GREEN_COLOR_1 @"#2a8c19"
#define GREEN_COLOR_2 @"#81bb27"

#define LINE_COLOR @"#E5ECEE"
#define CARD_OUTLINE_COLOR @"#E1E8F3"

#define BG_GRAY_COLOR @"#F6F6F6"
#define BGVIEW_GRAY_COLOR @"#F1F6FE"

#define FONT_BLACK_COLOR @"#888888"
#define FONT_GRAY_COLOR @"#333333"

#define UICOLOR_RGB(a, b, c, alp) [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:alp]
#define GRAY_COLOR_BG UIColorHex(0xf1f6fd)
#define DARK_GRAY_COLOR_TEXT UIColorHex(0x222426)
#define LIGHT_GRAY_COLOR_TEXT UIColorHex(0x82888E)
#define BLUE_COLOR UIColorHex(0x1995dd)//背景蓝色主色调

//20170725规范
#define STD1_DEEP_BLACK_COLOR UIColorHex(0x353B4A)//加重色字体
#define STD2_NORMAL_BLACK_COLOR UIColorHex(0x5E6370)//常规黑色字体
#define STD3_SUB_NORMAL_GRAY_COLOR UIColorHex(0xAEB0B8)//次常规灰色字体
#define STD4_SUB_NORMAL_LIGHT_GRAY_COLOR UIColorHex(0xDCDDE0)//次常规浅灰色字体
#define STD5_BG_LIGHT_GRAY_COLOR UIColorHex(0xF5F7F6)//背景色
#define STD6_DIVIDING_LINE_COLOR UIColorHex(0xE6E7EB)//分割线颜色

#define STD1_BLUE_COLOR UIColorHex(0x21B2FF)//背景蓝色主色调
#define STD2_LIGHT_PURPLE_COLOR_ASSIST UIColorHex(0x90ABFA)//浅紫辅助色
#define STD3_PURPLE_COLOR_ASSIST UIColorHex(0xB4A8FF)//紫辅助色
#define STD4_GREEN_COLOR_ASSIST UIColorHex(0x81F052)//绿辅助色
#define STD5_PINK_COLOR_ASSIST UIColorHex(0xFF8FAD)//绿辅助色
#define STD6_YELLOW_COLOR_ASSIST UIColorHex(0xFFD557)//黄色辅助色

#define STD_YELLOW1_COLOR_ASSIST UIColorHex(0xFFE8A4)//超出XXM的黄色字体
#define STD_DIVIDING1_LINE_COLOR UIColorHex(0x71CEFF)//导航栏分割线颜色
#define STD_MENUBAR_NORMAL_TEXT_COLOR UIColorHex(0x82888E)//menuBar未选中字体颜色
#define STD_MENUBAR_SELECTED_TEXT_COLOR UIColorHex(0x222426)//menuBar选中字体颜色
#define STD_MENUBAR_NORMAL_BG_COLOR UIColorHex(0xF4F7F7)//menuBar未选中背景色
#define STD_TABLEVIEW_DIVIDING_LINE_COLOR UIColorHex(0xE6E7EB)//tableView分割线颜色
#define STD_DEFAULT_LINE_BG_COLOR UIColorHex(0xf1faff)//未选中线的背景色

#define STD_FFFFFF_COLOR UIColorHex(0xFFFFFF)//白色


#define APP_sourceid @"028002"
#define Login_AppKey @"3BDAF68D6455EAE7"
#define Login_Appid @"02800206"
#define Vedio_Key @"2f8cc53a647a4822b3bb37721edf4210"
#define DESKey     @"TcRlEiyjizMOfK4uTquKdQ5x"

#define isiPhone6               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(750, 1334), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define isiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define isiPhone4               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 960), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#pragma mark - 宏

#define JUST_FONT(SIZE)            [UIFont systemFontOfSize:[BaseFunction adjustFontSzieWithScreenScale:SIZE]]
#define JUST_BOLD_FONT(SIZE)       [UIFont boldSystemFontOfSize:[BaseFunction adjustFontSzieWithScreenScale:SIZE]]

#define iPhone67 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone67_Big ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone67_plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone67_plus_Big ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

/**新版字体规范**/

#define BLUE_COLOR_LLMS [UIColor colorWithString:@"#1995dd"]
#define SWITCH_COLOR RGB(216, 226, 234)
#define GREEN_COLOR RGB(71, 213, 47)
#define GRAY_COLOR RGB(215, 221, 218)
#define BG_COLOR RGB(247, 248, 249)
#define TOP_TITLE_COLOR [UIColor colorWithString:@"#BFC5CC"]

//列表颜色
#define Top_Title_Bar_Color [UIColor colorWithString:@"#405b84"]//上标题栏颜色
#define List_Normal_Color   [UIColor colorWithString:@"#ffffff"]//普通列表颜色
#define List_Select_Color   [UIColor colorWithString:@"#f1f6fe"]//列表按下颜色
#define List_Bottom_Color   [UIColor colorWithString:@"#cfd9e7"]//列表内分割线/边缘分割线
#define Modular_Color       [UIColor colorWithString:@"#f1f6fe"]//模块颜色
#define Home_Line_Color     [UIColor colorWithString:@"#d9e3e9"]//首页分割线颜色

//字体颜色
#define T1_Title_Color      [UIColor colorWithString:@"#ffffff"]//T1字体颜色
#define T2_Title_Color      [UIColor colorWithString:@"#ffffff"]//T2字体颜色
#define T3_Title_Color      [UIColor colorWithString:@"#ffffff"]//T3字体颜色
#define T4_Title_Color      [UIColor colorWithString:@"#ffffff"]//T4字体颜色
#define T5_Title_Color      [UIColor colorWithString:@"#bddbfd"]//T5字体颜色
#define T6_Title_Color      [UIColor colorWithString:@"#222426"]//T6字体颜色
#define T7_Title_Color      [UIColor colorWithString:@"#222426"]//T7字体颜色
#define T8_Title_Color      [UIColor colorWithString:@"#222426"]//T8字体颜色
#define T9_Title_Color      [UIColor colorWithString:@"#222426"]//T9字体颜色
#define T10_Title_Color     [UIColor colorWithString:@"#1895dd"]//T10字体颜色
#define T11_Title_Color     [UIColor colorWithString:@"#1895dd"]//T11字体颜色
#define T12_Title_Color     [UIColor colorWithString:@"#82888e"]//T12字体颜色
#define T13_Title_Color     [UIColor colorWithString:@"#82888e"]//T13字体颜色
#define T14_Title_Color     [UIColor colorWithString:@"#82888e"]//T14字体颜色
#define T15_Title_Color     [UIColor colorWithString:@"#2d6484"]//T15字体颜色
#define T16_Title_Color     [UIColor colorWithString:@"#2d6484"]//T16字体颜色

//其他常用字颜色
#define Orange_Title_Color  [UIColor colorWithString:@"#ff9000"]//T16字体颜色
#define Gray_Title_Color    [UIColor colorWithString:@"#bfc5cc"]//T16字体颜色
#define Yellow_Title_Color  [UIColor colorWithString:@"#ffd800"]//T16字体颜色

//字体大小
#define T1_Title_Font       [UIFont fontWithName:@"Arial" size:18]//T1字体大小
#define T2_Title_Font       [UIFont fontWithName:@"Arial" size:16]//T2字体大小
#define T3_Title_Font       [UIFont fontWithName:@"Arial" size:14]//T3字体大小
#define T4_Title_Font       [UIFont fontWithName:@"Arial" size:12]//T4字体大小
#define T5_Title_Font       [UIFont fontWithName:@"Arial" size:10]//T5字体大小
#define T6_Title_Font       [UIFont fontWithName:@"Arial" size:18]//T6字体大小
#define T7_Title_Font       [UIFont fontWithName:@"Arial" size:16]//T7字体大小
#define T8_Title_Font       [UIFont fontWithName:@"Arial" size:14]//T8字体大小
#define T9_Title_Font       [UIFont fontWithName:@"Arial" size:12]//T9字体大小
#define T10_Title_Font      [UIFont fontWithName:@"Arial" size:14]//T10字体大小
#define T11_Title_Font      [UIFont fontWithName:@"Arial" size:12]//T11字体大小
#define T12_Title_Font      [UIFont fontWithName:@"Arial" size:14]//T12字体大小
#define T13_Title_Font      [UIFont fontWithName:@"Arial" size:12]//T13字体大小
#define T14_Title_Font      [UIFont fontWithName:@"Arial" size:10]//T14字体大小
#define T15_Title_Font      [UIFont fontWithName:@"Arial" size:14]//T15字体大小
#define T16_Title_Font      [UIFont fontWithName:@"Arial" size:12]//T16字体大小

//通用颜色
#define C1_Color      [UIColor colorWithString:@"#1895DD"]//C1颜色
#define C2_Color      [UIColor colorWithString:@"#ffffff"]//C2颜色
#define C3_Color      [UIColor colorWithString:@"#f1f6fe"]//C3颜色

/*
 0 企业版本
 1 AppStore版本
 */
#define APNS_PRODUCTION_ID   @"0"

/*
 推送key
 个人 "daa6348405b1e81e6f46de53"
 企业  "28dcd2d162ec52214daa17b5"
 */
#define Push_Key @"28dcd2d162ec52214daa17b5"

//保存时间（年月）
#define Save_Mouth @"Save_Mouth"
//保存时间(所有的数据缓存都用这个字段保存时间)
#define SaveTimeKey        @"Savetimekey"
//保存我的套餐推荐套餐key
#define MyPackageRecommendKey      @"MyPackageRecommendKey"
//保存流量订购推荐套餐key
#define OrderRecommendPackageKey   @"OrderRecommendPackageKey"
//保存流量订购4G包key
#define FlowShare4gPackageKey   @"FlowShare4gPackageKey"
//1G送2G套餐包key
#define Send1g2gPackageKey   @"Send1g2gPackageKey"
//保存首页套餐key
#define HomePackageKey     @"HomePackageKey"
//保存我的套餐key
#define MyPackageKey       @"MyPackageKey"
//保存设置key
#define ServerSettingKey   @"ServerSettingKey"
//保存设置isNewkey
#define SettingIsNewKey    @"SettingIsNewKey"
//保存设置hasNewkey
#define SettingHasNewKey   @"SettingHasNewKey"
//保存我的语音短信key
#define MyVoiceKey         @"MyVoiceKey"
//保存配置图标key
#define IconConfigureKey   @"IconConfigureKey"
//保存历史流量key
#define HistoryKey         @"HistoryKey"
//保存话费信息key
#define PhoneShareKey      @"PhoneShareKey"
//保存积分信息key
#define IntegralKey        @"IntegralKey"
//保存星级时间key
#define StarSaveTimeKey        @"StarSaveTimeKey"
//保存已安装福建手机营业厅用户请求时间Key
#define InstalledLlmsContactsTimeKey        @"InstalledLlmsContactsTimeKey"
//保存已安装福建手机营业厅用户标记数据Key
#define InstalledLlmsContactsDataKey        @"InstalledLlmsContactsDataKey"
//保存启动广告key
#define LaunchAdKey @"LaunchAdKey"
//保存星级信息key
#define StarKey        @"StarKey"
//保存积分规则版本key
#define IntegralRulesVersionKey    @"IntegralRulesVersionKey"
//保存积分规则key
#define IntegralRulesInfoKey   @"IntegralRulesInfoKey"
//月流量提醒
#define MonthRemindKey    @"MonthRemindKey"
#define MonthSwitchKey   @"MonthSwitchKey"       //月流量提醒开关
#define MonthFlowRemindKey @"MonthFlowRemindKey"   //剩余多少时提醒
//短信提醒
#define SMSMessageKey      @"SMSMessageKey"
#define SMSSwitchKey      @"SMSSwitchKey"        //短信总开关
#define SMSArrayKey        @"SMSArrayKey"          //短信里面的三个开发数组（日，周，月提醒）
//版本更新信息
#define VersionUpdateKey @"VersionUpdateKey"     //版本更新

#define SystemMsgTimeKey @"SystemMsgTimeKey" //系统通知时间
#define ActivityMsgTimeKey @"ActivityMsgTimeKey" //活动公告时间
#define SettingNewKey @"SettingNewKey" //设置新的

#define Map_APIKey @"681077f6213a38b865db65b61a973b54"
/*
 友盟key
 App Store版   5b3792fe8f4a9d479700007a
 企业版         5a4e5a6a8f4a9d0ce3000556
 
  公车演示（试用）版  5bb614caf1f556c691000afd
 */
//#define UM_APP_ID @"5a4e5a6a8f4a9d0ce3000556"
#define UM_WX_APP_ID @"wx64a58d6c51fd6ef1"
#define UM_WX_APP_SECRET @"6853ff338430e0183f3fbafe73bea722"
#define UM_QQ_APP_ID @"1101820148"
#define UM_QQ_APP_KEY @"pfxkSjbKI0HJkJcc"

#define CHANNEL_ID  @"1020_0001"
#define TEST_PHONE @"15280085135"
/*
 极光key
 App Store版  7b77cf64e32cc14117adfc3b
 企业版        f0235d7d89ea5070d9eed84d
 
 公车演示（试用）版  366a360a95f6578ea6915d6c
 公车宝  31efedc1ad6617b96dba3584
 */
//#define JPush_Key @"7d83cf2fbe9366348b6b5d29" //@"31efedc1ad6617b96dba3584"
#define Page_Count 10

/*
 地图key
 App Store版  3zslz4rBBQA3vqIaLF1kudg69yKGZl9t
 企业版        ghgqBWkKdvgQLELzmqGxRbUZ2C1j6uxn
 
  公车演示（试用）版 5pvtIqSBZ4urtYeG67wE9ITjR9CNjdcn
 公车宝  ge1GWokWYNhp7GSohcO6oesggpQIORNe
 
 包名   com.officialCar.user
        com.carGC.user
 
        com.busTest.user
    公车宝  com.busTreasure.user
 */
//#define Baidu_Map_Key @"In7RCWyvneioabOm9qlV9cr03OVgXDG3" //@"ge1GWokWYNhp7GSohcO6oesggpQIORNe"
#define IsAppStore 0


#if GCB_TYPE == 1       // 铁塔车管家
    #define APP_NAME        @"铁塔车管家"
    #define JPush_Key       @"3454cae115d56a438a393d87"
//    #define JPush_Key       @"21b834cb33ae2f87f701b5e4"
    #define APNS_IS_PRO     YES
//    #define Baidu_Map_Key   @"qv0pSiyuYSQRZogyIuT7ZfzwsSwkn6S2"
    #define Baidu_Map_Key   @"t6bL19OlX1eoptWrKlEXgw2qjrwmBzGi"
#elif GCB_TYPE == 2     // 高速车管家
    #define APP_NAME        @"高速车管家"
    #define JPush_Key       @"83cdfa96547436db16b39902"
//    #define JPush_Key       @"de07b6d5c43f0823ebf16a83"
    #define APNS_IS_PRO     YES
    #define Baidu_Map_Key   @"AVf6OrEXTc1AfOHSaUOwfDeMtpNP3GoR"
//    #define Baidu_Map_Key   @"jVo7vOMFa1SZ9WjX6I9crr9emXlvh5Nv"
#else                   // 公车宝
    #define APP_NAME        @"公车宝"
    #define JPush_Key       @"7d83cf2fbe9366348b6b5d29"
    #define APNS_IS_PRO     YES
    #define Baidu_Map_Key   @"In7RCWyvneioabOm9qlV9cr03OVgXDG3"
#endif


#endif /* PublicMacro_h */
