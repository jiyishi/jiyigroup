//
//  SearchViewController.m
//  jiyiwangluo
//
//  Created by Zen Shen on 15/9/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITextFieldDelegate>
{
    UITextField* _searchField;
    UIButton* _delbutton;
    UIImageView *leftIcon;
    
}
@end

@implementation SearchViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _searchField= [[UITextField alloc]initWithFrame:CGRectMake(10,70,JYWidth-20,40)];
    [self.view addSubview:_searchField];
    leftIcon = [[UIImageView alloc]init];
    leftIcon.image = [UIImage imageNamed:@"sousuo_baitian_hit"];
    leftIcon.width = 30;
    leftIcon.height = 30;
    leftIcon.contentMode = UIViewContentModeCenter;
    
    _searchField.leftView = leftIcon;
    _searchField.leftViewMode = UITextFieldViewModeAlways;
    _searchField.font= [UIFont systemFontOfSize:16];
    _searchField.layer.masksToBounds = YES;
    _searchField.layer.cornerRadius = 10;
    _searchField.placeholder = @"请输入你要搜索的内容";
    _searchField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    _searchField.layer.borderWidth = 5;
    _searchField.layer.borderColor = [UIColor cyanColor].CGColor;
    [_searchField setReturnKeyType:UIReturnKeySearch];
    _searchField.delegate=self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField*)theTextField {
    
    [theTextField resignFirstResponder];
    return YES;
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
