
//
//  SetPassController.m
//  JYRegisterViewDemo
//
//  Created by asios on 15/8/15.
//  Copyright (c) 2015年 梁大红. All rights reserved.
//

#import "SetPassController.h"
#import "JYRegisterView.h"
#import "UserLabelViewController.h"

@interface SetPassController ()

@end

@implementation SetPassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    JYRegisterView *JYSetPassView = [[JYRegisterView alloc]
                                     initwithFrame:self.view.bounds action:^(NSString *key1, NSString *key2) {
                                         NSLog(@"%@%@",key1,key2);
                                         UserLabelViewController *userCtrl = [[UserLabelViewController alloc]init];
                                         [self presentViewController:userCtrl animated:YES completion:nil];
                                     }];
    [self.view addSubview:JYSetPassView];
    
}
@end
