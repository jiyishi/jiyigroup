//
//  DesignerViewController.m
//  jiyiwangluo
//
//  Created by Zen Shen on 15/9/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DesignerViewController.h"
#import "HomeViewController.h"

@interface DesignerViewController ()
{
    UIButton* _loveButton;
    
}
@end

@implementation DesignerViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, JYWidth, 64)];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    UIButton* button = [MyUtil createBtnFrame:CGRectMake(5, 10, 50, 50) title:@"返回" target:self action:@selector(backAction)];
    [view addSubview:button];
    _loveButton = [MyUtil createBtnFrame:CGRectMake(JYWidth - 60, 15, 30, 30) image:@"heart1" selectImage:nil highlightImage:nil target:self action: @selector(loveAction)];
    [view addSubview:_loveButton];
    
    
}

-(void)backAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark -- 喜欢按钮

-(void)loveAction{
    
    
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
