//
//  BaseViewController.m
//  GCB_UserLib
//
//  Created by sjtx on 2022/5/30.
//

#import "BaseViewController.h"

#define kTitleViewHeight    44
#define kTitleViewMargin    10
#define kTitleViewMaxWidth (SCR_WIDTH * 0.8)
#define kTitleLabelTag      100
#define kLeftImgBtnTag      200
#define kRightImgBtnTag     300
#define kLeftTitleBtnTag    400
#define kRightTitleBtnTag   500
#define AnimationDuration   0.25

@interface BaseViewController ()
{
    UIView *_noDataView;
    UIView *_noNetworkView;
    UIView *_errorView;
}

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorHex(0xf5f7f6);
    
    [self setReturnBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //    if (self != m_mainVc) {
    //        if ((m_nav.viewControllers.count > 1 && self.navigationController == m_nav) || m_nav.viewControllers.count == 1) {
    //            [[UIApplication sharedApplication] setStatusBarStyle:self.setStatusBarLightContentWhenPushed ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault];
    //        }
    //    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
//    [NOTI_CENTER removeObserver:self];
    NSLog(@"%@ 销毁", self);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}


#pragma mark - Page
- (void)showErrorView
{
    if (_errorView.superview != nil) {
        [_errorView removeFromSuperview];
    }
    _errorView = [[UIView alloc] initWithFrame:SCR_BOUNDS];
    _errorView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_errorView];
    
    UIImageView *errorImg = [[UIImageView alloc] initWithImage:IMAGE(@"no_data")];
    errorImg.center = POINT(SCR_WIDTH/2, SCR_HEIGHT/2-65);
    [_errorView addSubview:errorImg];
    
    UILabel *errorTip = [UILabel frame:RECT(0, 0, SCR_WIDTH, 40) name:@"啊哦，出错了!" size:18 andTextColor:COLOR(@"#cecece")];
    errorTip.center = POINT(SCR_WIDTH/2, SCR_HEIGHT/2);
    errorTip.textAlignment = 1;
    [_errorView addSubview:errorTip];
    
    UIButton *errorRefreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    errorRefreshBtn.frame = RECT((SCR_WIDTH-150)/2, SCR_HEIGHT/2+35, 150, 40);
    [errorRefreshBtn setTitle:@"马上刷新" forState:UIControlStateNormal];
    [errorRefreshBtn setBackgroundImage:IMAGE(@"refresh_btn") forState:UIControlStateNormal];
    [errorRefreshBtn addTarget:self action:@selector(hideErrorView) forControlEvents:UIControlEventTouchUpInside];
    [_errorView addSubview:errorRefreshBtn];
}

- (void)hideErrorView
{
    if (_errorView.superview != nil) {
        [_errorView removeFromSuperview];
    }
}

- (void)showNoDataView
{
    if (_noDataView.superview != nil) {
        [_noDataView removeFromSuperview];
    }
    _noDataView = [[UIView alloc] initWithFrame:SCR_BOUNDS];
    _noDataView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_noDataView];
    
    UIImageView *noDataImg = [[UIImageView alloc] initWithImage:IMAGE(@"no_data")];
    noDataImg.center = POINT(SCR_WIDTH/2, SCR_HEIGHT/2-65);
    [_noDataView addSubview:noDataImg];
    
    UILabel *noDataTip = [UILabel frame:RECT(0, 0, SCR_WIDTH, 40) name:@"空空如也..." size:18 andTextColor:COLOR(@"#cecece")];
    noDataTip.center = POINT(SCR_WIDTH/2, SCR_HEIGHT/2);
    noDataTip.textAlignment = 1;
    [_noDataView addSubview:noDataTip];
    
    UIButton *noDataRefreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noDataRefreshBtn.frame = RECT((SCR_WIDTH-150)/2, SCR_HEIGHT/2+35, 150, 40);
    [noDataRefreshBtn setTitle:@"马上刷新" forState:UIControlStateNormal];
    [noDataRefreshBtn setBackgroundImage:IMAGE(@"refresh_btn") forState:UIControlStateNormal];
    [noDataRefreshBtn addTarget:self action:@selector(hideNoDataView) forControlEvents:UIControlEventTouchUpInside];
    [_noDataView addSubview:noDataRefreshBtn];
}

- (void)hideNoDataView
{
    if (_noDataView.superview != nil) {
        [_noDataView removeFromSuperview];
    }
}
- (UIView *)getNoDateViewWithFrame:(CGRect)frame andContent:(NSString *)content
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:view.bounds];
    imageView.image = IMAGE(@"tri_detail_detial_bg");
    [view addSubview:imageView];
    
    CGFloat remainHeight = frame.size.height - 103 - 17 - 15;
    CGFloat orginY = remainHeight / 7 * 3;
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:RECT((view.width - 128)/2, orginY, 128, 103)];
    iconImageView.image = IMAGE(@"hvm_no_data");
    [view addSubview:iconImageView];
    
    UILabel *titleLabel = [UILabel frame:RECT(30, iconImageView.top + iconImageView.height + 17, view.width - 60, 15) name:content size:17 andTextColor:HexRGB(0xb2b2b2)];
    [view addSubview:titleLabel];
    
    return view;
}

- (void)showNoNetworkView
{
    if (_noNetworkView.superview != nil) {
        [_noNetworkView removeFromSuperview];
    }
    _noNetworkView = [[UIView alloc] initWithFrame:SCR_BOUNDS];
    _noNetworkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_noNetworkView];
    
    UIImageView *noNetworkImg = [[UIImageView alloc] initWithImage:IMAGE(@"no_network")];
    noNetworkImg.center = POINT(SCR_WIDTH/2, SCR_HEIGHT/2-65);
    [_noNetworkView addSubview:noNetworkImg];
    
    UILabel *noNetworkTip = [UILabel frame:RECT(0, 0, SCR_WIDTH, 40) name:@"没有网络，不开心!" size:18 andTextColor:COLOR(@"#cecece")];
    noNetworkTip.center = POINT(SCR_WIDTH/2, SCR_HEIGHT/2);
    noNetworkTip.textAlignment = 1;
    [_noNetworkView addSubview:noNetworkTip];
    
    UIButton *noNetworkRefreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noNetworkRefreshBtn.frame = RECT((SCR_WIDTH-150)/2, SCR_HEIGHT/2+35, 150, 40);
    [noNetworkRefreshBtn setTitle:@"马上刷新" forState:UIControlStateNormal];
    [noNetworkRefreshBtn setBackgroundImage:IMAGE(@"refresh_btn") forState:UIControlStateNormal];
    [noNetworkRefreshBtn addTarget:self action:@selector(hideNoNetworkView) forControlEvents:UIControlEventTouchUpInside];
    [_noNetworkView addSubview:noNetworkRefreshBtn];
}

- (void)hideNoNetworkView
{
    if (_noNetworkView.superview != nil) {
        [_noNetworkView removeFromSuperview];
    }
}
- (void)loadBaseViewWithTitle:(NSString *)title andAction:(SEL)action
{
    _bgView = [[UIView alloc]initWithFrame:RECT(0, 0, SCR_WIDTH, 216)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:RECT(0, 0, SCR_WIDTH, 216)];
    imageView.image = IMAGE(@"trip_bg");
    [_bgView addSubview:imageView];
    
    UIButton *btn = [UIButton frameWithFrame:RECT(0, STATUS_BAR_HEIGHT, 60, 44) andImage:@"" andHighlightedImage:@"" andTarget:self andAction:action];
    [btn setImage:IMAGE(@"tri_detail_back") forState:UIControlStateNormal];
    btn.tag = 999;
    [_bgView addSubview:btn];
    
    UILabel *titleLabel = [UILabel frame:RECT((SCR_WIDTH - 120)/2, STATUS_BAR_HEIGHT + 11, 120, 18) name:title size:18 andTextColor:[UIColor whiteColor]];
    [_bgView addSubview:titleLabel];
    
}
- (void)loadBaseViewWithTitle:(NSString *)title andAction:(SEL)action rightTitle:(NSString *)rightTitle rightImage:(NSString *)rightImage rightAction:(SEL)rightAction
{
    _bgView = [[UIView alloc]initWithFrame:RECT(0, 0, SCR_WIDTH, 216)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:RECT(0, 0, SCR_WIDTH, 216)];
    imageView.image = IMAGE(@"trip_bg");
    [_bgView addSubview:imageView];
    
    UIButton *btn = [UIButton frameWithFrame:RECT(0, STATUS_BAR_HEIGHT, 60, 44) andImage:@"" andHighlightedImage:@"" andTarget:self andAction:action];
    [btn setImage:IMAGE(@"tri_detail_back") forState:UIControlStateNormal];
    btn.tag = 999;
    [_bgView addSubview:btn];
    
    UILabel *titleLabel = [UILabel frame:RECT((SCR_WIDTH - 120)/2, STATUS_BAR_HEIGHT + 11, 120, 18) name:title size:18 andTextColor:[UIColor whiteColor]];
    [_bgView addSubview:titleLabel];
    
    if(rightImage.length > 0){
        UIButton *rightBtn = [UIButton frameWithFrame:RECT(SCR_WIDTH - 42, STATUS_BAR_HEIGHT + 9, 27, 27) andImage:@"" andHighlightedImage:@"" andTarget:self andAction:rightAction];
        [rightBtn setImage:IMAGE(rightImage) forState:UIControlStateNormal];
        [_bgView addSubview:rightBtn];
    }
    else if(rightTitle.length > 0){
        UIButton *rightBtn = [UIButton frameWithFrame:RECT(SCR_WIDTH - 65, STATUS_BAR_HEIGHT, 50, 44) andTitle:rightTitle andFont:16 andTarget:self andAction:rightAction];
        [_bgView addSubview:rightBtn];
    }
}
- (void)adjustBgviewFrame
{
    
}
- (void)loadNoDataCellWithTitle:(NSString *)title andFrame:(CGRect)frame
{
    self.noDataView =  [self getNoDateViewWithFrame:frame andContent:title];
    self.noDataCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noDataCell"];
    self.noDataCell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.noDataCell.backgroundColor = [UIColor clearColor];
    [self.noDataCell addSubview:self.noDataView];
}
#pragma mark - Title/TitleView
- (void)setNavigationView:(UIView *)view
{
    self.navigationItem.titleView = view;
}

- (void)setNavigationTitle:(NSString *)title
{
    self.title = title;
    self.navigationItem.title = title;
}

- (void)setNavigationTitlebgImg:(NSString *)title
{
    [self setNavigationTitle:title];
    
//    if (@available(iOS 15.0, *)) {
//            UINavigationBarAppearance *barApp = [UINavigationBarAppearance new];
//            barApp.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
//            self.navigationController.navigationBar.scrollEdgeAppearance = barApp;
//            self.navigationController.navigationBar.standardAppearance = barApp;
//        }
    
    
}

- (void)setNavigationItemTitle:(NSString *)title{
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    view.frame = RECT(0, 0, SCR_WIDTH, kTitleViewHeight);
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.tag = kTitleLabelTag;
    titleLabel.font = [UIFont systemFontOfSize:18];
    [view addSubview:titleLabel];
    self.navigationItem.titleView = titleLabel;
}

- (void)setNavigationTitleView:(NSString *)title
{
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    view.frame = RECT(0, 0, SCR_WIDTH, kTitleViewHeight);
    view.backgroundColor = [UIColor clearColor];
    
    UIView *line = [[UIView alloc] initWithFrame:RECT(-10, 10, 0.5, view.height-20)];
    line.backgroundColor = RGBA(232, 232, 232, 0.8);
    [view addSubview:line];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.tag = kTitleLabelTag;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.frame = RECT(line.left + line.width + kTitleViewMargin, 5, view.width, view.height-10);
    float width = [BaseFunction getLabelSize:titleLabel.text width:kTitleViewMaxWidth font:titleLabel.font].width;
    titleLabel.width = width > kTitleViewMaxWidth ? kTitleViewMaxWidth: width;
    [view addSubview:titleLabel];
    
    self.navigationItem.titleView = view;
}

- (void)setTitleViewStr:(NSString *)title
{
    for (id subview in self.navigationItem.titleView.subviews) {
        if ([subview isKindOfClass:[UILabel class]] && [subview viewWithTag:kTitleLabelTag]) {
            UILabel *titleLabel = (UILabel *)subview;
            titleLabel.text = title;
            float width = [BaseFunction getLabelSize:titleLabel.text width:kTitleViewMaxWidth font:titleLabel.font].width;
            titleLabel.width = width > kTitleViewMaxWidth ? kTitleViewMaxWidth: width;
            break;
        }
    }
}

- (NSString *)getTitleViewStr
{
    NSString *text = @"";
    for (id subview in self.navigationItem.titleView.subviews) {
        if ([subview isKindOfClass:[UILabel class]] && [subview viewWithTag:kTitleLabelTag]) {
            UILabel *titleLabel = (UILabel *)subview;
            text = titleLabel.text;
        }
    }
    return text;
}

#pragma mark - BarButtonItem

- (void)addLeftBarButtonItems:(UIBarButtonItem *)leftBarButton {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = (IOS7_OR_LATER ? 0 : 10);
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, leftBarButton, nil];
}

- (void)addRightBarButtonItems:(UIBarButtonItem *)rightBarButton {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = (IOS7_OR_LATER ? 0 : 10);
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, rightBarButton, nil];
}

- (UIButton *)setLeftItemWithImageName:(NSString *)imageName
                  highlightedImageName:(NSString *)heighlightedImageName
                                action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.frame = RECT(0, 0, 60, 44);
    //    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIImage *image = [UIImage imageNamed:imageName];
    [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    button.width = [self getBarBtnWidthWithImage:image title:@"" font:FONT(12)];
    
    
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.tag = kLeftImgBtnTag;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self addLeftBarButtonItems:item];
    
    return button;
    
}

- (UIButton *)getLeftItemCustomImageView
{
    for (id subview in self.navigationItem.leftBarButtonItems) {
        if ([subview isKindOfClass:[UIBarButtonItem class]]) {
            UIBarButtonItem *item = (UIBarButtonItem *)subview;
            if (item.customView.tag == kLeftImgBtnTag) {
                return (UIButton *)item.customView;
            }
        }
    }
    return nil;
}

- (UIButton *)setRightItemWithImageName:(NSString *)imageName
                   highlightedImageName:(NSString *)heighlightedImageName
                                 action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = RECT(0, 0, 25, 25);
    [button setImage:IMAGE(imageName) forState:UIControlStateNormal];
    [button setImage:IMAGE(heighlightedImageName) forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.tag = kRightImgBtnTag;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self addRightBarButtonItems:item];
    
    return button;
}

- (UIButton *)getRightItemCustomImageView
{
    for (id subview in self.navigationItem.rightBarButtonItems) {
        if ([subview isKindOfClass:[UIBarButtonItem class]]) {
            UIBarButtonItem *item = (UIBarButtonItem *)subview;
            if (item.customView.tag == kRightImgBtnTag) {
                return (UIButton *)item.customView;
            }
        }
    }
    return nil;
}

- (UIButton *)setLeftItemWithTitle:(NSString *)title
                            action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = RECT(0, 0, 50, 20);
    button.tag = kLeftTitleBtnTag;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self addLeftBarButtonItems:item];
    
    return button;
}

- (UIButton *)setLeftItemWithTitleAndArrow:(NSString *)title
                                    action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.textAlignment = 0;
    [button setImage:IMAGE(@"arrow_down") forState:UIControlStateNormal];
    [button setImage:IMAGE(@"arrow_down") forState:UIControlStateSelected];
    [button setImage:IMAGE(@"arrow_down") forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = RECT(0, 0, title.length*15+25, 20);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, title.length*15, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -45, 0, 0);;
    button.tag = kLeftTitleBtnTag;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self addLeftBarButtonItems:item];
    
    return button;
}

- (UIButton *)getLeftItemCustomTitleView
{
    for (id subview in self.navigationItem.rightBarButtonItems) {
        if ([subview isKindOfClass:[UIBarButtonItem class]]) {
            UIBarButtonItem *item = (UIBarButtonItem *)subview;
            if (item.customView.tag == kLeftTitleBtnTag) {
                return (UIButton *)item.customView;
            }
        }
    }
    return nil;
}

- (UIButton *)setRightItemWithTitle:(NSString *)title action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = RECT(0, 0, 40, 20);
    button.tag = kRightTitleBtnTag;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self addRightBarButtonItems:item];
    
    return button;
}

- (UIButton *)getRightItemCustomTitleView
{
    for (id subview in self.navigationItem.rightBarButtonItems) {
        if ([subview isKindOfClass:[UIBarButtonItem class]]) {
            UIBarButtonItem *item = (UIBarButtonItem *)subview;
            if (item.customView.tag == kRightTitleBtnTag) {
                return (UIButton *)item.customView;
            }
        }
    }
    return nil;
}


#pragma mark    - 导航栏左右按钮

//设置返回按钮
- (void)setReturnBtn
{
    [self setLeftBtnWithTitle:nil image:@"tri_detail_back"];
    [self.leftBtn removeAllTargets];
    [self.leftBtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
}

//退出
- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)setLeftBtnWithTitle:(NSString *)title image:(NSString *)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 44, 44);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:self action:@selector(leftBtnCallback:) forControlEvents:UIControlEventTouchUpInside];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = FONT(16);
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        [btn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    btn.width = [self getBarBtnWidthWithImage:image title:title font:btn.titleLabel.font];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    self.leftBtn = btn;
}

- (void)leftBtnCallback:(UIButton *)btn
{
}

- (void)setRightBtnWithTitle:(NSString *)title image:(NSString *)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 60, 44);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:self action:@selector(rightBtnCallback:) forControlEvents:UIControlEventTouchUpInside];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:DARK_GRAY_COLOR_TEXT forState:UIControlStateNormal];
        btn.titleLabel.font = FONT(16);
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        [btn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    btn.width = [self getBarBtnWidthWithImage:image title:title font:btn.titleLabel.font];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    self.rightBtn = btn;
}

- (void)rightBtnCallback:(UIButton *)btn
{
}

- (CGFloat)getBarBtnWidthWithImage:(UIImage *)image title:(NSString *)title font:(UIFont *)font
{
    CGFloat titleWidth = [title widthForFont:font];
    CGFloat imageWidth = image.size.width;
    CGFloat btnWidth = titleWidth + imageWidth;
    btnWidth = btnWidth < 44 ? 44 : btnWidth;
    return btnWidth;
}


#pragma mark - Loading

- (void)showLoading
{
    _loadingCount++;
    FNLOG(@"showLoading %ld", (long)_loadingCount);
    [self.view makeToastActivity];
}

- (void)showLoading:(NSString *)message
{
    _loadingCount++;
    FNLOG(@"showLoading %ld", (long)_loadingCount);
    [self.view makeToastActivityWithToash:message];
}

- (void)hideLoading
{
    if (_loadingCount > 0) {
        _loadingCount--;
    }
    FNLOG(@"hideLoading %ld", (long)_loadingCount);
    if (_loadingCount == 0) {
        [self.view hideToastActivity];
    }
}

- (void)forceHideLoading
{
    _loadingCount = 0;
    FNLOG(@"hideLoading %ld", (long)_loadingCount);
    if (_loadingCount == 0) {
        [self.view hideToastActivity];
    }
}

#pragma mark - Toast

- (void)showToast:(NSString *)message
{
    [self.view makeToast:message];
}

- (void)showToast:(NSString *)message duration:(CGFloat)interval
{
    [self.view makeToast:message duration:interval position:CSToastDefaultPosition title:nil image:nil];
}

- (void)showToast:(NSString *)message duration:(CGFloat)interval title:(NSString *)title
{
    [self.view makeToast:message duration:interval position:CSToastDefaultPosition title:title image:nil];
}

- (void)showToast:(NSString *)message title:(NSString *)title image:(UIImage *)image
{
    [self.view makeToast:message duration:CSToastDefaultDuration position:CSToastDefaultPosition title:title image:image];
}

- (void)showToast:(NSString *)message duration:(CGFloat)interval title:(NSString *)title image:(UIImage *)image
{
    [self.view makeToast:message duration:interval position:CSToastDefaultPosition title:title image:image];
}


#pragma mark    - 常规数据操作

//刷新第一页数据
- (void)refreshData
{
}
//加载下一页数据
- (void)requestMoreData
{
}
//加载某页数据
- (void)requestDataAtPage:(NSInteger)page
{
}
//组合数据 方便tableView调用
- (void)combineData
{
}
//加载本地缓存数据
- (void)loadLocalData
{
}
//初始化tableView
- (void)setupTableView
{
}
//- (EvaDetailCell *)evaDetailCell
//{
//    if (!_evaDetailCell) {
//        _evaDetailCell = [EvaDetailCell evaDetailCellCreate];
//    }
//    return _evaDetailCell;
//}

@end
