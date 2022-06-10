//
//  BaseViewController.h
//  GCB_UserLib
//
//  Created by sjtx on 2022/5/30.
//

#import <UIKit/UIKit.h>
#import "NYPubLibImport.h"
#import "BaseFunction.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property (nonatomic, assign) BOOL hidesNavigationBarWhenPushed;//push时隐藏导航栏
@property (nonatomic, assign) BOOL setStatusBarLightContentWhenPushed;//push时设置状态栏为白色
@property (nonatomic, assign) BOOL popGestureRecognizerDisabled;//滑动返回是否禁用 默认NO

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableDataList;//存储用于tableView展示的数据
@property (nonatomic, strong) NSMutableArray *dataList;//存储接口返回的数据

@property (nonatomic, assign) BOOL isInsertCustomBackground;
@property (nonatomic, assign) NSInteger loadingCount;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *noDataView;
@property (nonatomic, strong) UITableViewCell *noDataCell;
@property (nonatomic, assign) NSInteger requestPage;
@property (nonatomic, assign) CGFloat evaluateCellH;
//@property (nonatomic,strong) EvaDetailCell *evaDetailCell;

#pragma mark - TitleView
- (void)setNavigationView:(UIView *)view;
- (void)setNavigationTitle:(NSString *)title;
- (void)setNavigationTitlebgImg:(NSString *)title;
- (void)setNavigationTitleView:(NSString *)title;
- (void)setTitleViewStr:(NSString *)title;
- (NSString *)getTitleViewStr;

#pragma mark - BarButtonItem
- (UIButton *)setLeftItemWithImageName:(NSString *)imageName
                  highlightedImageName:(NSString *)heighlightedImageName
                                action:(SEL)action;
- (UIButton *)getLeftItemCustomImageView;

- (UIButton *)setRightItemWithImageName:(NSString *)imageName
                   highlightedImageName:(NSString *)heighlightedImageName
                                 action:(SEL)action;
- (UIButton *)getRightItemCustomImageView;

- (UIButton *)setLeftItemWithTitle:(NSString *)title action:(SEL)action;
- (UIButton *)setLeftItemWithTitleAndArrow:(NSString *)title action:(SEL)action;
- (UIButton *)getLeftItemCustomTitleView;

- (UIButton *)setRightItemWithTitle:(NSString *)title action:(SEL)action;
- (UIButton *)getRightItemCustomTitleView;
- (void)addRightBarButtonItems:(UIBarButtonItem *)rightBarButton;


#pragma mark - Loading
- (void)showLoading;
- (void)showLoading:(NSString *)message;
- (void)hideLoading;
- (void)forceHideLoading;

#pragma mark - Toast
- (void)showToast:(NSString *)message;
- (void)showToast:(NSString *)message duration:(CGFloat)interval;
- (void)showToast:(NSString *)message duration:(CGFloat)interval title:(NSString *)title;
- (void)showToast:(NSString *)message title:(NSString *)title image:(UIImage *)image;
- (void)showToast:(NSString *)message duration:(CGFloat)interval title:(NSString *)title image:(UIImage *)image;

#pragma mark - Page
- (void)showErrorView;
- (void)hideErrorView;
- (void)showNoNetworkView;
- (void)hideNoNetworkView;
- (void)showNoDataView;
- (void)hideNoDataView;
- (UIView *)getNoDateViewWithFrame:(CGRect)frame andContent:(NSString *)content;
- (void)loadBaseViewWithTitle:(NSString *)title andAction:(SEL)action;
- (void)loadBaseViewWithTitle:(NSString *)title andAction:(SEL)action rightTitle:(NSString *)rightTitle rightImage:(NSString *)rightImage rightAction:(SEL)rightAction;
- (void)adjustBgviewFrame;
- (void)loadNoDataCellWithTitle:(NSString *)title andFrame:(CGRect)frame;
#pragma mark    - 常规数据操作

//刷新第一页数据
- (void)refreshData;
//加载下一页数据
- (void)requestMoreData;
//加载某页数据
- (void)requestDataAtPage:(NSInteger)page;
//组合数据 方便tableView调用
- (void)combineData;
//加载本地缓存数据
- (void)loadLocalData;
//初始化tableView
- (void)setupTableView;


#pragma mark    - 导航栏左右按钮

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

//设置返回按钮
- (void)setReturnBtn;
//退出
- (void)popViewController;
//设置左上按钮
- (void)setLeftBtnWithTitle:(NSString *)title image:(NSString *)imageName;
- (void)leftBtnCallback:(UIButton *)btn;
//设置右上按钮
- (void)setRightBtnWithTitle:(NSString *)title image:(NSString *)imageName;
- (void)rightBtnCallback:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
