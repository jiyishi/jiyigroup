//
//  UserLabelViewController.m
//  jiyiwangluo
//
//  Created by mac on 15/9/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UserLabelViewController.h"
#import "LogInController.h"

@interface UserLabelViewController ()

@end

@implementation UserLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *loginBtn = [MyUtil createBtnFrame:CGRectMake(100, 100, 100, 40) title:@"完成" target:self action:@selector(loginAction)];
    [self.view addSubview:loginBtn];
}

-(void)loginAction
{
    LogInController *loginCtrl = [[LogInController alloc]init];
    [self presentViewController:loginCtrl animated:NO completion:nil];
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
