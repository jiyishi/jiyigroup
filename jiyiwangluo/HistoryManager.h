//
//  HistoryManager.h
//  CarLife
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryManager : NSObject

+(HistoryManager *)shareHistory;

//添加一条数据
-(void)insertHistory:(NSString *)history;

//删除一条记录
-(void)deleteUserWithHistoryTitle:(NSString *)historyTitle;

//删除所有数据
-(void)deleteAllHistory;

//修改
-(void)updateUser:(NSString *)history num:(int)historyNum;

//查询数据
-(NSArray *)selectAllHistory;

@end
