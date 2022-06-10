//
//  PublicEnum.h
//  BaminLife
//
//  Created by 窗外` on 17/5/4.
//  Copyright © 2017年 Steven. All rights reserved.
//

#ifndef PublicEnum_h
#define PublicEnum_h
typedef void (^CommomBlock)(id data);
//tableViewCell类型
typedef enum : NSUInteger {
    CellType_Normal = 0,
    CellType_NoNetwork = 1,//无网络
    CellType_Empty = 2,//无数据
    CellType_Loading = 3,//加载中
    CellType_Search = 4,//搜索
    CellType_Custom1 = 11,//自定义
    CellType_Custom2 = 12,
    CellType_Custom3 = 13,
} CellType;

//SearchTableView 随身厅二级搜索界面状态 展示搜索结果状态 搜索无数据状态
typedef NS_ENUM(NSInteger, SearchStatus) {
    SearchingStatus = 0,
    SearchResultStatus,
    SearchNoResultStatus
};

typedef enum {
    NoticeSubTypeBus = 1,//出行提醒
    NoticeSubTypeGrow,//成长提醒
    NoticeSubTypePostage,//资费、优惠活动提醒
    NoticeSubTypeEmail,//邮件、空间备份提醒
    NoticeSubTypeLifePayment,//生活缴费提醒
    NoticeSubTypeShoppingFinancial,//购物理财提醒
    NoticeSubTypeMemorandum,//备忘录
}NoticeSubType;

//提醒cell样式
typedef NS_ENUM(NSUInteger, NoticeCellType) {
    NoticeCellTypeNormal = 0,
    NoticeCellTypeEmpty,
};

//生活缴费账户类型
typedef enum : NSUInteger {
    LifePaymentType_Water,//水费
    LifePaymentType_Electricity,//电费
} LifePaymentType;

//文件类型
typedef enum : NSUInteger {
    FileType_Photo = 0,
    FileType_Video = 1,
    FileType_Audio = 2,
} WZFileType;

//应用类型
typedef enum : NSUInteger {
    AppType_Bus_Trip = 0,//公交出行
    AppType_Subway_Recharge,//地铁卡充值
    AppType_Address_Backup,//通讯录备份
    AppType_Album_Backup,//相册备份
    AppType_Sms_Backup,//短彩信备份
    AppType_Cloud,//云盘
    AppType_139mailbox,//139邮箱
    AppType_Phone_Recharge,//话费充值
    AppType_Financial,//理财
    AppType_Shopping,//购物
    AppType_Water,//缴水费
    AppType_Electricity,//缴电费
    AppType_Life_Nearby,//生活周边
    AppType_Find_Work,//找工作
} AppType;

//应用类型网络请求类型
typedef enum {
    RequestErrorCodeSuccess = 1,          //请求成功，数据正常
    RequestErrorCodeOther = 2,            //请求成功，其他错误
    RequestErrorCodeVerificationFail = 3, //请求成功，验证码过期，需要重新登录
    RequestErrorCodeNoResponseData = 4,   //请求成功，解析出错，无数据
    RequestErrorCodeNoNetwork = 5,        //无网络
} RequestErrorCode;

//生活缴费记录筛选类型
typedef enum : NSUInteger {
    LifePaymentFilterType_All,
    LifePaymentFilterType_Water,
    LifePaymentFilterType_Electricity,
} LifePaymentFilterType;

//反馈类型
typedef enum : NSUInteger {
    FeedbackType_Suggestion = 1,
    FeedbackType_Bug,
    FeedbackType_Other,
} FeedbackType;

//数据类型 搜索状态 正常状态
typedef NS_ENUM(NSInteger, ContactDataType) {
    ContactDataTypeNormal = 1,
    ContactDataTypeSearch
};

//流量森林 - 动态
typedef enum : NSInteger {
    FFDynamicType_StealGold = 1,//偷金币
    FFDynamicType_Water = 2,//浇水
    FFDynamicType_Comment = 3,//评论
    FFDynamicType_Bitten = 4,//偷金币
    FFDynamicType_Task = 5,//任务完成
    FFDynamicType_Update = 6,//升级
    FFDynamicType_Store = 7,//购买道具
} FFDynamicType;

//领取金币类型
typedef enum : NSUInteger {
    CollectGoldType_Flow = 1,
    CollectGoldType_MyGold = 2,
    CollectGoldType_FriendGold = 3,
    CollectGoldType_Task = 4,
} CollectGoldType;

typedef NS_ENUM(NSInteger, TableViewDataType) {
    DataTypeLetterNormal = 1,
    DataTypeLetterSearch
};
typedef NS_ENUM(NSInteger, ChoiceDestinationType) {
    ChoiceDestinationTypeDeparture = 1,
    ChoiceDestinationTypeDestination, //目的地
    ChoiceDestinationTypeAgainForFrom,//再次选择出发地
    ChoiceDestinationTypeAgainForTo,//再次选择目的地
};
typedef NS_ENUM(NSInteger, DetailVehicleType) {
    DetailVehicleTypeNoVehicle = 0,//未接单
    DetailVehicleTypeNoCar,//已接单-未派车
    DetailVehicleTypeCar,//已派车
};
typedef NS_ENUM(NSInteger, ReportStatisticsType) {
    ReportStatisticsTypeCar = 0,
    ReportStatisticsTypeDistance,
};
typedef NS_ENUM(NSInteger, CarMangerType) {
    CarMangerTypeNormal = 0,
    CarMangerTypeSelect,
};
typedef NS_ENUM(NSInteger, DriverMangerType) {
    DriverMangerTypeNormal = 0,
    DriverMangerTypeSelect,
};
typedef NS_ENUM(NSInteger, TripRecordType) {
    TripRecordTypeMoreDriver = 0,//已派车-多个司机
    TripRecordTypeOneDriverCancel,//已派车-单个司机-可取消订单
    TripRecordTypeOneDriverEvaluate,//已派车-单个司机-待评价
    TripRecordTypeOneDriverTrackReplay,//已派车-单个司机-轨迹回放
    TripRecordTypeOneDriverOther,
    TripRecordTypeOneDriverOtherReject,//拒绝
    TripRecordTypeCanCancle,//可以取消
};
typedef NS_ENUM(NSInteger, TripRecordProgressType) {
    TripRecordProgressNoCar = 0,//未派车
    TripRecordProgressCaring,//订单进行中
    TripRecordProgressWaitingEvaluation,//订单待评价
    TripRecordProgressFinish,//结束订单-已评价
    TripRecordProgressOther,
    TripRecordProgressCanCancle,//可以取消
};
typedef NS_ENUM(NSInteger, ApplicanTripType) {
    ApplicanTripTypeMy = 0,
    ApplicanTripTypePending,
};
#endif /* PublicEnum_h */
