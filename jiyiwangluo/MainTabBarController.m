//
//  MainTabBarController.m
//  jiyiwangluo
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()<afHttpDelegate>
{
    UIView *_bgView;
    NSArray *_titleArray;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleArray = @[@"首页",@"日历",@"资讯",@"我"];
    [self createViewControllers];
    self.tabBar.hidden=YES;
    [self createTabBar];
}

-(void)createViewControllers
{
    NSArray *array=@[@"HomeViewController",@"CalendarViewController",@"InformationViewController",@"MineViewController"];
    NSMutableArray *arrVc=[NSMutableArray array];
    for (int i=0; i<array.count; i++) {
        NSString *name=array[i];
        Class cls=NSClassFromString(name);
        UIViewController *vc=[[cls alloc]init];
        vc.title = _titleArray[i];
        vc.view.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:0.8];
        UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:vc];
        [arrVc addObject:nv];
    }
    self.viewControllers=arrVc;
}

-(void)createTabBar
{
    _bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 667-49, 375, 49)];
    _bgView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_bgView];
    
    //循环创建按钮
    NSArray *imageArray = @[@"菜谱-A",@"发现-A",@"卖汤汤A",@"我的-A"];
    NSArray *selectImageArray = @[@"菜谱-B",@"发现-B",@"卖汤汤B",@"我的-B"];
    
    CGFloat btnW=375.0f/4;
    for (int i=0; i<4; i++) {
        UIButton *btn=[MyUtil createBtnFrame:CGRectMake(btnW*i, 0, btnW, 49) image:imageArray[i] selectImage:selectImageArray[i] highlightImage:nil target:self action:@selector(btnClick:)];
        btn.tag=100+i;
        
        UILabel *label=[MyUtil createLabelFrame:CGRectMake(0, 30, btnW, 19) title:_titleArray[i] font:[UIFont systemFontOfSize:20]];
        label.textAlignment=NSTextAlignmentCenter;
        label.tag=300;
        [btn addSubview:label];
        
        [_bgView addSubview:btn];
        if (i==0) {
            btn.selected=YES;
            label.textColor=[UIColor redColor];
        }else{
            label.textColor=[UIColor whiteColor];
        }
    }
}

-(void)btnClick:(UIButton *)btn
{
    UIButton *lastBtn=(UIButton *)[_bgView viewWithTag:100+self.selectedIndex];
    UILabel *label=(UILabel *)[btn viewWithTag:300];
    UILabel *lastLabel=(UILabel *)[lastBtn viewWithTag:300];
    if (lastBtn!=btn) {
        lastBtn.selected=NO;
        btn.selected=YES;
        label.textColor=[UIColor redColor];
        lastLabel.textColor=[UIColor whiteColor];
        self.selectedIndex=btn.tag-100;
    }
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
