//
//  LeftInfoViewController.m
//  jiyiwangluo
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "LeftInfoViewController.h"

@interface LeftInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSMutableArray *_dataArr;
}

@end

@implementation LeftInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    self.view.y = 20;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebar_bg"]];
    [self createTableView];
    
    for (NSInteger i = 0; i<10; i++) {
        NSString *str = [NSString stringWithFormat:@"%ld",i];
        [_dataArr addObject:str];
    }
    
}

-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, JYWidth/3, JYHeight*2/3) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    static int i = 1;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",i++];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
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
