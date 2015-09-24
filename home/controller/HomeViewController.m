//
//  HomeViewController.m
//  jiyiwangluo
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ClothesCell.h"
#import "ClothesModel.h"
#import "ClothDetailController.h"
#import "DesignerViewController.h"
#import "UIBarButtonItem+Badge.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView* _menueView;
    UIScrollView* _scrollView;
    UIScrollView* _designerScrollView;
    UITableView* _tableView;
    UIView* _view;
}
@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;

    //导航栏按钮
    
    UIBarButtonItem* searchButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sousuo_baitian_hit.png"] style:UIBarButtonItemStyleDone target:self action:@selector(searchButton)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10,10,30, 30);
    [button addTarget:self action:@selector(informationButton) forControlEvents:UIControlEventTouchDown];
    [button setBackgroundImage:[UIImage imageNamed:@"dvq"] forState:UIControlStateNormal];
    UIBarButtonItem *informationButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    informationButton.badgeValue = @"1";
    informationButton.badgeBGColor = self.navigationController.navigationBar.tintColor;
    
    self.navigationItem.rightBarButtonItems = @[informationButton,searchButton];
    
    //订单状态方法
    
    [self menueOrAction];
    
    //设计师方法
    
    [self designer];
    
    //服装展示方法
    
    [self closeShow];
}

#pragma mark --导航栏按钮点击事件

-(void)searchButton{
    
    SearchViewController* searchButton = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchButton animated:YES];
    
}

-(void)informationButton{
    
}

#pragma mark -- 订单状态方法

-(void)menueOrAction{
    
    _menueView  = [[UIView alloc]initWithFrame:CGRectMake(0, 64, JYWidth, 100)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, JYWidth, 100)];
    imageView.image = [UIImage imageNamed:@"00.jpg"];
    [_menueView addSubview:imageView];
    [self.view addSubview:_menueView];

}

#pragma mark -- 设计师

-(void)designer{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_menueView.frame), JYWidth, JYHeight-100-_menueView.frame.size.height)];
    [self.view addSubview:_scrollView];
    
    _view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, JYWidth, 150)];
    [_scrollView addSubview:_view];
    
    _designerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, JYWidth, 150)];
    _designerScrollView.bounces = NO;
    _designerScrollView.showsVerticalScrollIndicator = NO;
    [_view addSubview:_designerScrollView];
    for (int i=0; i<5; i++) {
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(JYWidth*i, 0, JYWidth, _designerScrollView.frame.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(designerTouch)];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 200 + i;
        [imageView addGestureRecognizer:tap];
        [_designerScrollView addSubview:imageView];
    }
    _designerScrollView.contentSize = CGSizeMake(JYWidth*5, 0);

}

#pragma mark -- 服装

-(void)closeShow{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, JYWidth, JYHeight-_designerScrollView.frame.size.height-49) style:UITableViewStylePlain];
    [_scrollView addSubview:_tableView];
    _tableView.tableHeaderView = _view;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

#pragma mark -- 点击设计师图片跳转

-(void)designerTouch{
    
//    UIImageView* imageView = (UIImageView*)[self.view viewWithTag:200+i];
    DesignerViewController* designer = [[DesignerViewController alloc]init];
    [self presentViewController:designer animated:YES completion:nil];
    
}

#pragma mark -- tableView代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"identifier";
    ClothesCell* cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell == nil) {
        cell = [[ClothesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ClothesModel* model = [[ClothesModel alloc]init];
    [cell conFig:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ClothDetailController* clothDetail = [[ClothDetailController alloc]init];
    [self.navigationController pushViewController:clothDetail animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
