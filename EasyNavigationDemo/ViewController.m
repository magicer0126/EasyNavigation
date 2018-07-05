//
//  ViewController.m
//  EasyNavigationDemo
//
//  Created by Mr_Chen on 17/8/31.
//  Copyright © 2017年 chenliangloveyou. All rights reserved.
//

#import "ViewController.h"

#import "EasyNavigation.h"


#import "NavEmptyViewController.h"
#import "NavTransparentViewController.h"
#import "NavAlphaChangeViewController.h"
#import "NavOperateViewController.h"

#import "NavSmoothHidenViewController.h"
#import "NavSmoothHiden_1_ViewController.h"
#import "NavAnimationHidenViewController.h" 
#import "NavAnimationHiden_1_ViewController.h"

#import "NavCustomSlidingViewController.h"
#import "NavSystemSlidingViewController.h"
#import "NavScrollIncludeViewController.h"

#import "NavStatusBarViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic,strong)UITableView *tableView ;
@property (nonatomic,strong)NSArray *dataArray ;
@property (nonatomic,strong)NSArray *navDataArray ;

@end

@implementation ViewController
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated ];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationView setTitle:@"首页"];
    self.statusBarStyle = UIStatusBarStyleDefault ;

    kWeakSelf(self)
    [self.navigationView addLeftButtonWithTitle:@"更多" clickCallBack:^(UIView *view) {
        [weakself.navigationView setTitle:@"点击了更多"];
    }];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(10, 50, 300, 20)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.navigationView addTitleView:blueView callback:^(UIView *view) {
        
    }];
//    [self.navigationView addLeftButtonWithTitle:@" 你好！" image:[UIImage imageNamed:@"button_normal.png"] clickCallBack:^(UIView *view) {
//
//    }];
//
//    [self.navigationView addLeftButtonWithTitle:@"好的" image:nil hightImage:nil backgroundImage:[EasyNavigationUtils createImageWithColor:[UIColor blueColor]] clickCallBack:^(UIView *view) {
//
//    }];
//    self.navigationView.title = @"w d " ;
//    self.navigationView.titleLabel.text = @"fjsdk发送对方浆您好";
//    self.navigationView.titleLabel.numberOfLines= 0 ;
//    self.navigationView.titleLabel.backgroundColor = [UIColor redColor];
//    self.navigationView.titleLabel.font= [UIFont systemFontOfSize:11];
//    self.navigationView.titleLabel.frame =CGRectMake(2300, 10, 200, 20);
    
    self.navigationView.backgroundView.image = nil ;
    self.navigationView.backgroundView.backgroundColor = [UIColor blueColor];
    self.navigationView.backgroundView.alpha = 0.3 ;
//    self.navigationView.backgroundView.alpha = 0 ;
    
//    [self.navigationView.backgroundImageView removeFromSuperview];
//    [self.navigationView addRightButtonWithImage:[UIImage imageNamed:@"button_normal.png"] clickCallBack:^(UIView *view) {
//        NavStatusBarViewController *nav=  [[NavStatusBarViewController alloc]init];
//        [nav.navigationView setTitle:@"您好"];
//        [weakself.navigationController pushViewController:nav animated:YES];
//    }];
    
    [self.navigationView addLeftButton:^EasyNavigationButton *{
        EasyNavigationButton *b = [EasyNavigationButton button].setTitleFrame(CGRectMake(0, 34, 60, 10)).setImageFrame(CGRectMake(0, 0, 60, 34)).setTitle(@"很啦就").setImageName(@"button_normal.png");
        return b;
    } callback:^(UIView *view) {
        
    }];
//    [btn setTitle:@"您好" forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"button_normal.png"] forState:UIControlStateNormal];
    
   
//    [self.navigationView addLeftBarButtonWithImageName:@"button_normal.png" callback:^(UIView *view) {
//
//    }];
//    [self.navigationView addLeftBarButtonWithTitle:@"好的" callback:^(UIView *view) {
//
//    }];
//    [self.navigationView addLeftBarButtonWithConfig:^EasyNavButtonConfig *{
//        return [EasyNavButtonConfig shared].setTitle(@"好的");
//    } callback:^(UIView *view) {
//
//    }];

//    self.navbigTitleType = NavBigTitleTypeAll ;
//    self.navigationView.scrollview = self.tableView ;
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    [self.view addSubview:self.tableView];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-NavigationNorlmalHeight_N(), 0, 0, 0);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
  
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth_N(), 60)];
    img.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableHeaderView =img ;

    
//    EasyNavigationButton *b = [EasyNavigationButton button];
//    b.title  = @"fdskljflksj";
//    b.center= self.view.center;
////    [b setFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:b];

}


#pragma mark - Tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellStyleValue1;
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell ;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    Class tempVC = self.navDataArray[indexPath.section][indexPath.row] ;
    BaseViewController *vc = [[tempVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10 ;
}

#pragma mark - getter/setter
//- (UITableView *)tableView
//{
//    if (nil == _tableView) {
//        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
//        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//        _tableView.contentInset = UIEdgeInsetsMake(NavigationHeight_N(), 0, 0, 0);
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
//        _tableView.dataSource = self ;
//        _tableView.delegate = self ;
//        if (@available(iOS 11.0, *)) {
//            _tableView.estimatedRowHeight = 0;
//            _tableView.estimatedSectionHeaderHeight = 0;
//            _tableView.estimatedSectionFooterHeight = 0;
//            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic ;
//        }
//
//        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth_N(), 60)];
//        img.backgroundColor = [UIColor lightGrayColor];
//        _tableView.tableHeaderView =img ;
//    }
//    return _tableView ;
//}

- (NSArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = @[
                       @[@"导航栏操作"],
                       @[ @"透明", @"导航条渐变"],
                       @[@"无导航条",@"导航条滚动隐藏", @"导航条滚动隐藏(statusBar下停止)", @"导航条动画隐藏",  @"导航条动画隐藏(statusBar下停止)"],
                       @[@"禁用系统返回手势", @"自定义返回手势", @"嵌套scrollview返回"],
                       @[@"statusBar状态改变"]];
    }
    return _dataArray ;
}
- (NSArray *)navDataArray
{
    if (nil == _navDataArray) {
        _navDataArray = @[
                          @[[NavOperateViewController class]],
                          @[[NavTransparentViewController class],
                            [NavAlphaChangeViewController class]],
                          @[[NavEmptyViewController class],
                            [NavSmoothHidenViewController class],
                            [NavSmoothHiden_1_ViewController class],
                            [NavAnimationHidenViewController class],
                            [NavAnimationHiden_1_ViewController class]],
                          @[[NavSystemSlidingViewController class],
                            [NavCustomSlidingViewController class],
                            [NavScrollIncludeViewController class]],
                          @[[NavStatusBarViewController class]]
                          ];
    }
    return _navDataArray ;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
