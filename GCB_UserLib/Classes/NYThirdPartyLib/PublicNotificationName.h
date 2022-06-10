//
//  PublicNotificationName.h
//  BaminLife
//
//  Created by 窗外` on 17/5/4.
//  Copyright © 2017年 Steven. All rights reserved.
//

#ifndef PublicNotificationName_h
#define PublicNotificationName_h

#define NOTIF_LOGOUT @"NOTIF_LOGOUT"//注销

#define NOTIF_NETWORK_CHANGE @"NOTIF_NETWORK_CHANGE"//网络状态发生改变

#define NOTIF_ZF_FINISHED @"NOTIF_ZF_FINISHED"//ZF成功通知网页页面跳转到订单列表

#pragma mark - 首页左侧抽屉红点相关
#define NOTIF_BADGE_REFRESH @"NOTIF_BADEGE_REFRESH"    // 刷新Badge
#define NOTIF_BADGE_REQUEST @"NOTIF_BADGE_REQUEST"     // 请求Badge Api

#pragma mark    - 通知管理 
#define NOTIF_PUSH_CONFIG_VALUE_DID_CHANGE @"NOTIF_PUSH_CONFIG_VALUE_DID_CHANGE"//推送设置被修改
#define NOTIF_PUCH_CONFIG_GET_NOTICE_MESSAGE_SWITCH @"NOTIF_PUCH_CONFIG_GET_NOTICE_MESSAGE_SWITCH"// 重新获取管理首页开关通知信息
#define NOTIF_PUCH_UPDATE_MEMBERCENTER_NOTICE_MESSAGE_COUNT @"NOTIF_PUCH_UPDATE_MEMBERCENTER_NOTICE_MESSAGE_COUNT"// 更新Memcenter的通知消息数目
#define NOTIF_COMPARE_TIME_TO_SEND_MESSAGE @"NOTIF_COMPARE_TIME_TO_SEND_MESSAGE"//登录后比对时间主动发送信息给后台服务器，后台再推送通知信息
#define NOTIF_UPLOADING_JPUSH_REGISTRATIONID @"NOTIF_UPLOADING_JPUSH_REGISTRATIONID"//上传JPUSH RegistrationID


#pragma mark    - 生活缴费

#define NOTIF_COMMON_APP_LIST_CHANGED @"NOTIF_COMMON_APP_LIST_CHANGED"//常用应用列表修改
#define NOTIF_APP_LIST_DID_REFRESH @"NOTIF_APP_LIST_DID_REFRESH"//应用列表已刷新
#define NOTIF_FAMILY_INFO_NEED_REFRESH @"NOTIF_FAMILY_INFO_NEED_REFRESH"//家庭信息需要刷新
#define NOTIF_FAMILY_INFO_DID_REFRESH @"NOTIF_FAMILY_INFO_DID_REFRESH"//家庭列表已刷新


#pragma mark - 流量秘书相关通知
#define Notification_homeMap                     @"Notification_homeMap"       //取消homeMap
#define Notification_verification_code_failure   @"Notification_verification_code_failure"//验证码失效
#define Notification_login_out                   @"Notification_login_out"   //退出登录通知
#define Notification_login                       @"Notification_login"       //登录通知
#define Notification_login_out_by_setting        @"Notification_login_out_by_setting"    //设置界面退出登录
#define Notification_message_delete_success      @"Notification_message_delete_success"  //消息删除成功通知
#define Notification_message_read_success        @"Notification_message_read_success"    //消息已读成功通知
#define Notification_month_remind                @"Notification_month_remind"//月流量提醒通知
#define Notification_reload_flow                 @"Notification_reload_flow"//刷新流量
#define Notification_pushInfo                    @"Notification_pushInfo" //极光推送信息
#define Notification_SplashScreen               @"Notification_SplashScreen"//闪屏消息点击
#define Notification_refresh_GPRS_data           @"Notification_refresh_GPRS_data"//积分兑换完刷新套餐数据
#define Notification_replace_ask_friend_flow @"Notification_replace_ask_friend_flow"//代充向好友求流量
#define Notification_replace_help_friend_reward_flow @"Notification_replace_help_friend_reward_flow"//代充好友向你求流量后赏ta
#define Notification_replace_help_friend_ignore_flow @"Notification_replace_help_friend_ignore_flow"//代充好友向你求流量忽略
#define Notification_replace_help_friend_flow @"Notification_replace_help_friend_flow"//代充为ta充流量
#define Notification_show_home_guide_view @"Notification_show_home_guide_view"//展示home引导图
#define Notification_phone_pay_result_report @"Notification_phone_pay_result_report" //话费充值结果汇报
#define Notification_flow_share_deputy_auto_loginout @"Notification_flow_share_deputy_auto_loginout"//流量共享副号主动退出
#define Notification_flow_share_jump_open_share @"Notification_flow_share_jump_open_share"//订完次月4G套餐，然后跳转到共享开通页面。
#define Notification_flow_share_refresh_main_info @"Notification_flow_share_refresh_main_info"//流量共享刷新主号数据
#define Notification_flow_share_add_family_member @"Notification_flow_share_add_family_member"//流量共享添加家庭成员
#define Notification_flow_share_add_share_member @"Notification_flow_share_add_share_member"//流量共享添加共享成员
#define Notification_flow_share_open_family @"Notification_flow_share_open_family"//流量共享开通家庭网
#define Notification_flow_share_delete_family_member @"Notification_flow_share_delete_family_member"//流量共享删除家庭成员
#define Notification_acc_refresh_info @"Notification_acc_refresh_info"//加速操作刷新信息

#define Notification_pcc_refresh_info @"Notification_pcc_refresh_info"//限速操作刷新信息

#define Notification_Oredr_GoON100_Success @"Notification_Oredr_GoON100_Success"//流量100促销包订购成功
#define Notification_Messafe_Reload @"Notification_Messafe_Reload"//刷新消息首页红点
#define Notification_Refresh_Head_Portrait @"Notification_Refresh_Head_Portrait"//刷新头像
#define Notification_Notice_Query_30m @"Notification_Notice_Query_30m"//详单查询超过30分钟需重新登录
#define Notification_Notice_Query_Detail_List @"Notification_Notice_Query_Detail_List"//详单查询明细列表
#define Notification_add_family_v_member @"Notification_add_family_v_member"//添加家庭V成员

#define NSNotification_DelInfoView        @"delInfoView"  //删除联系人界面通知
#define NSNotification_CallWeb            @"callweb"     //web浏览器调用网页回调
#define NSNotification_closeContactsView  @"closeContractsViewCtr"//关闭通讯录
#define NSNotification_isexistContact     @"isexistnotification"//添加联系人通知
#define NSNotification_addPeopleInfo      @"addPeoplenotification"//添加联系人在通讯录中的信息回调通知
#define NSNotification_delPeopleInfo      @"delPeoplenotification"//手动删除联系人信息回调通知
#define NSNotification_savePeopleInfo     @"savePeoplenotification" //保存手动添加联系人信息

#define NSNotification_FlowChange         @"NSNotification_FlowChange"//流量发生变化 积分兑流量，流量包兑换
#define NSNotification_PhoneFareChange    @"NSNotification_PhoneFareChange"//话费发生变化 话费充值 流量代付
#define NSNotification_home_config_update @"NSNotification_home_config_update"//主要配置数据更新
#define NSNotification_Home_Report_Update @"NSNotification_Home_Report_Update"//网页活动体验升级 点击了首页 需要上传首页点击刷新按钮事件
#define NSNotification_Experience_Upgrade @"NSNotification_Experience_Upgrade"//体验升级刷新网页
#define NSNotification_Push_Right_Vc @"NSNotification_Push_Right_Vc"//右侧页面推进

#define Noti_GestureLock_Set @"Noti_GestureLock_Set"//手势密码设置密码成功
#define Noti_GestureLock_Success @"Noti_GestureLock_Success"//手势密码解锁成功
#define Noti_GestureLock_Wrong @"Noti_GestureLock_Wrong"//手势密码解密失败5次
#define Noti_Update_Contacts @"Noti_Update_Contacts"//重新加载通讯录

#define Noti_Update_Bamin_Contact @"Noti_Update_Bamin_Contact"//刷新八闽生活通讯录
#define Noti_ChangeCity @"Noti_ChangeCity"//流量森林 个人设置  选择城市

#define Noti_Widget_Open_App @"Noti_Widget_Open_App"   //通过widget打开app
#define Widget_Key @"group.com.cmcc.flow"
#define Noti_Flow_Delete_Friend @"Noti_Flow_Delete_Friend"//删除好友
#define Noti_Verifi_AddFriend @"Noti_Verifi_AddFriend"//添加好朋友

#pragma mark    - 流量森林
#define NOTIF_STEAL_FRIEND_GOLD_SUCCESS @"NOTIF_STEAL_FRIEND_GOLD_SUCCESS"//偷取好友金币
#define NOTIF_REFRESH_USER_FLOW_FOREST @"NOTIF_REFRESH_USER_FLOW_FOREST"//刷新流量森林信息

#define  Noti_Error_Location @"Noti_Error_Location"
#endif /* PublicNotificationName_h */
