//
//  HistoryManager.m
//  CarLife
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HistoryManager.h"

@implementation HistoryManager
{
    FMDatabase *_clDatabase;
}

+(HistoryManager *)shareHistory
{
    static HistoryManager *hisManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hisManager = [[HistoryManager alloc]init];
    });
    return hisManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDataBase];
    }
    return self;
}

-(void)createDataBase
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/history.sqlite"];
    JYLog(@"path = %@",path);
    //1.初始化数据对象
    _clDatabase = [[FMDatabase alloc]initWithPath:path];
    
    //2.打开数据库
    BOOL ret = [_clDatabase open];
    if (!ret) {
        NSLog(@"数据库打开失败:%@",_clDatabase.lastErrorMessage);
    }else{
        NSString *createSql = @"create table if not exists history (historyNum integer primary key autoincrement, historyTitle varchar(255))";
        
        BOOL flag = [_clDatabase executeUpdate:createSql];
        if (!flag) {
            JYLog(@"创建history表格失败:%@",_clDatabase.lastErrorMessage);
        }else{
            JYLog(@"创建成功");
        }
    }
}

-(void)insertHistory:(NSString *)history
{
    NSString *insertSql = @"insert into history (historyTitle) values(?)";
    BOOL ret = [_clDatabase executeUpdate:insertSql,history];
    if (!ret) {
        JYLog(@"添加失败:%@",_clDatabase.lastErrorMessage);
    }
}

-(void)deleteUserWithHistoryTitle:(NSString *)historyTitle
{
    NSString *deleteSql = @"delete from history where historyTitle=?";
    BOOL ret = [_clDatabase executeUpdate:deleteSql,historyTitle];
    if (!ret) {
        JYLog(@"删除失败:%@",_clDatabase.lastErrorMessage);
    }
}

-(void)deleteAllHistory
{
    NSString *selectSql = @"select * from history";
    FMResultSet *rs = [_clDatabase executeQuery:selectSql];
    NSString *deleteSql = @"delete from history where historyNum=?";
    //NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    //用游标的方式来管理数据
    while ([rs next]) {
        //创建对象
        NSString *history = [rs stringForColumn:@"historyNum"];
        BOOL ret = [_clDatabase executeUpdate:deleteSql,history];
        if (!ret) {
            JYLog(@"删除失败:%@",_clDatabase.lastErrorMessage);
        }else{
            JYLog(@"删除成功");
        }
    }
    
}

-(void)updateUser:(NSString *)history num:(int)historyNum
{
    NSString *updateSql = @"update user set historyTitle=? where historyNum=?";
    BOOL ret = [_clDatabase executeUpdate:updateSql,@(historyNum)];
    if (!ret) {
        JYLog(@"修改失败%@",_clDatabase.lastErrorMessage);
    }
}

-(NSArray *)selectAllHistory
{
    NSString *selectSql = @"select * from history";
    FMResultSet *rs = [_clDatabase executeQuery:selectSql];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    //用游标的方式来管理数据
    while ([rs next]) {
        //创建对象
        NSString *history = [rs stringForColumn:@"historyTitle"];
        [array addObject:history];
    }
    return array;
}


@end
