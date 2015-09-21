

//
//  LogInController.m
//  JYRegisterViewDemo
//
//  Created by asios on 15/8/15.
//  Copyright (c) 2015年 梁大红. All rights reserved.
//

#import "LogInController.h"
#import "JYRegisterView.h"
#import "MainTabBarController.h"
#import "JYController.h"
#import "LookPassController.h"

@interface LogInController ()

@end

@implementation LogInController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JYRegisterView *registerView = [[JYRegisterView alloc]
                                    initwithFrame:
                                    self.view.bounds
                                    JYRegisterViewType:JYRegisterViewTypeNav action:^(NSString *acc, NSString *key) {
                                        NSLog(@"点击了登录");
                                        NSLog(@"\n输入的账户%@\n密码%@",acc,key);
                                        MainTabBarController *mainCtrl = [[MainTabBarController alloc]init];
                                        [self presentViewController:mainCtrl animated:YES completion:nil];
                                    } zcAction:^{
                                        NSLog(@"点击了 注册");
                                        JYController *jyRegisCtrl = [[JYController alloc]init];
                                        [self presentViewController:jyRegisCtrl animated:YES completion:nil];
                                    } wjAction:^{
                                        LookPassController *lookPassCtrl = [[LookPassController alloc]init];
                                        [self presentViewController:lookPassCtrl animated:YES completion:nil];
                                        NSLog(@"点击了   忘记密码");
                                    }];
    [self.view addSubview:registerView];
}

@end
