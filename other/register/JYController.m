
//
//  ZCController.m
//  JYRegisterViewDemo
//
//  Created by asios on 15/8/15.
//  Copyright (c) 2015年 梁大红. All rights reserved.
//

#import "JYController.h"
#import "JYRegisterView.h"
@interface JYController ()

@end

@implementation JYController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    JYRegisterView *JYzcView = [[JYRegisterView alloc]
                                initwithFrame:self.view.bounds JYRegisterViewTypeSMS:JYRegisterViewTypeScanfPhoneSMS plTitle:@"请输入获取到的验证码"
                                title:@"下一步"
                                
                                hq:^BOOL(NSString *phoneStr) {
                                    
                                    return YES;
                                }
                                
                                tjAction:^(NSString *yzmStr) {
                                    
                                }];
    [self.view addSubview:JYzcView];
}

@end
