//
//  LookPassController.m
//  JYRegisterViewDemo
//
//  Created by asios on 15/8/15.
//  Copyright (c) 2015年 梁大红. All rights reserved.
//

#import "LookPassController.h"
#import "JYRegisterView.h"
@interface LookPassController ()

@end

@implementation LookPassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    JYRegisterView *JYzcView = [[JYRegisterView alloc]
                                initwithFrame:self.view.bounds JYRegisterViewTypeSMS:JYRegisterViewTypeNoScanfSMS plTitle:@"请输入验证码"
                                title:@"提交"
                                
                                hq:^BOOL(NSString *phoneStr) {
                                    
                                    return YES;
                                }
                                
                                tjAction:^(NSString *yzmStr) {
                                    
                                }];
    [self.view addSubview:JYzcView];
}
@end
