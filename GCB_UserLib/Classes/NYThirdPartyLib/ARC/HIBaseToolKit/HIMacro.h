//
//  HIMacro.h
//
//  Created by IVAN on 2020-05-20.
//  Copyright (c) 2020年 IVAN. All rights reserved.
//


#pragma mark -
#pragma mark 系统对象

#define HIAPP_APPLICATION     [UIApplication sharedApplication]
#define HIAPP_WINDOW          [UIApplication sharedApplication].delegate.window
#define HIAPP_DELEGATE        [UIApplication shareAppDelegate].delegate
#define HIAPP_ROOT_VC         [UIApplication sharedApplication].delegate.window.rootViewController

#pragma mark -
#pragma mark SIZE 尺寸

#define HISCREEN_WIDTH       ([UIScreen mainScreen].bounds.size.width)
#define HISCREEN_HEIGHT      ([UIScreen mainScreen].bounds.size.height)
#define HISIZE(w, h)           CGSizeMake(w, h)
#define HIPOINT(x, y)          CGPointMake(x, y)
#define HIRECT(x, y, w, h)     CGRectMake(x, y, w, h)

#pragma mark -
#pragma mark 图片

#define HIIMAGE(A)                [UIImage imageNamed:A]
#define HIIMAGEFILE_T(file, ext)  [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]] //读取本地图片
#define HIIMAGEFILE(A)            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]      //定义UIImage对象

#pragma mark -
#pragma mark 快速工具

#define HIUSR_DEFAULTS          [NSUserDefaults standardUserDefaults]
#define HINOTICE_CENTER         [NSNotificationCenter defaultCenter]
#define HIFORMAT(f, ...)        [NSString stringWithFormat:f, ##__VA_ARGS__]
#define HITRIM(S)               [S stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] // 空格清除
#define HILS(key)               NSLocalizedString(key, nil)
#define HIEND_EDITING           [self.view endEditing:YES]; // 结束编辑

#pragma mark -
#pragma mark 数据验证

#define HIVALUE(p, s)               (!p || [p isKindOfClass:[NSNull class]]? s: p)
#define HISTRING(p, s)              ([p isKindOfClass[NSString Class]] && p.length > 0? p: s)
#define HISTR(p)                    HISTRING(p, @"")
#define HIIndexPath(s, r)           (indexPath.section == s && indexPath.row == r)
#define HISTRING_CONTAIN(str, s)    ([str rangeOfString:s].location != NSNotFound)
#define HIDIC(p)                    (p != nil && [p isKindOfClass:[NSDictionary class]])
#define HIARRAY(p)                  (p != nil && [p isKindOfClass:[NSArray class]] && [s count] > 0)
#define HINUMBER(p)                 (p != nil && [p isKindOfClass:[NSNumber class]])
#define HICLASS(p, cls)             (p != nil && [p isKindOfClass:[cls class]])
#define HIDATA(p)                   (p != nil && [p isKindOfClass:[NSData class]])

#pragma mark -
#pragma mark 日志工具

#ifdef DEBUG
#define HILOG(FORMAT, ...)      fprintf(stderr, "==================================================================<\n [File]: %s \n [Function]: %s \n [Line]: %li \n [LOG]: %s\n==================================================================/>\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __PRETTY_FUNCTION__, (long)__LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define HILog(fmt, ...) 
#endif

#pragma mark -
#pragma mark 字体

#define HIFONT(FONTSIZE)                  [UIFont systemFontOfSize:FONTSIZE]
#define HIBOLD(FONTSIZE)                  [UIFont boldSystemFontOfSize:FONTSIZE]
#define HICUSTOM_FONT(NAME, FONTSIZE)     [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define HIFONTBOLD(p)                       [UIFont fontWithName:@"PingFangSC-Semibold" size:p]
#define HIFONTREGULAR(p)                    [UIFont fontWithName:@"PingFangSC-Regular" size:p]

#pragma mark -
#pragma mark GCD

//GCD - 延迟
#define HIGCD_AFTER(sec,afterQueueBlock)  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sec * NSEC_PER_SEC)), dispatch_get_main_queue(),afterQueueBlock);
//GCD - 一次性
#define HIGCD_ONCE(onceBlock) static      dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 主线程
#define HIGCD_MAIN(mainQueueBlock)        dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 后台
#define HIGCD_BACK(globalQueueBlock)      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#define HIGCD_Lock()                      dispatch_semaphore_wait(self->_lock, DISPATCH_TIME_FOREVER)
#define HIGCD_Unlock()                    dispatch_semaphore_signal(self->_lock)

#define HIWEAK(type)    __weak typeof(type) weak##type = type;
#define HISTRONG(type)  __strong typeof(type) type = weak##type;
#define HIBLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__);};

#pragma mark -
#pragma mark 颜色

//16进制
#define HICOLOR_HEX(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HICOLOR_RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define HICOLOR_RGB(r, g, b)      RGBA(r, g, b, 1.0f)
#define HICOLOR_BLACK             RGBA(0, 0, 0, 1)
#define HICOLOR_CLEAR             [UIColor clearColor]
#define HICOLOR_WHITE             [UIColor whiteColor]
#define HICOLOR_THEME             [UIColor colorWithPatternImage:HIIMAGE(@"theme")]     //主题色
#define HICOLOR_RANDOM            RGBColor(arc4random()%255, arc4random()%255, arc4random()%255) //随机颜色

#pragma mark -
#pragma mark 文件路径宏

#define HIPATH_TEMP                   NSTemporaryDirectory()
#define HIPATH_DOCUMENT               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define HIPATH_CACHE                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#pragma mark -
#pragma mark 检查系统版本

#define HISYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define HISYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define HISYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define HISYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define HISYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark -
#pragma mark 判断横竖屏

#define HIORITATION_IS_HORIZONTAL     ([UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeRight || [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationLandscapeLeft)
#define HIORITATION_IS_VERTICAL       ([UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortraitUpsideDown)




