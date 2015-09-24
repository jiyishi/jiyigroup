//
//  ForumModel.h
//  CarLife
//
//  Created by qianfeng on 15/7/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForumModel : NSObject

@property (nonatomic,assign)NSInteger createDate;
//论坛
@property (nonatomic,strong)NSString *forumName;

@property (nonatomic,strong)NSString *postImage;
@property (nonatomic,strong)NSString *postLink;
@property (nonatomic,strong)NSString *postTitle;
@property (nonatomic,assign)NSInteger replyCount;


@end
