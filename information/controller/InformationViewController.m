//
//  InformationViewController.m
//  jiyiwangluo
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "InformationViewController.h"
#import "JKSideSlipView.h"
#import "UIBarButtonItem+extension.h"

@interface InformationViewController ()
{
    JKSideSlipView *_sideSlipView;
}

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.y = 20;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shuye"]];
    
    _sideSlipView = [[JKSideSlipView alloc]initWithSender:self];
    _sideSlipView.backgroundColor = [UIColor redColor];
    
    UIBarButtonItem  *leftBtnItem = [UIBarButtonItem itemWithTarget:self action:@selector(switchAction:) image:@"jia" highImage:@"jia_h"];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    UIButton *nextBtn = [MyUtil createBtnFrame:CGRectMake(100, 100, 100, 40) title:@"下一页" target:self action:@selector(nextBtnAction:)];
    [self.view addSubview:nextBtn];
}

-(void)switchAction:(id)sender
{
    [_sideSlipView switchMenu];
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
