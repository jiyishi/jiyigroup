//
//  AFHttpManager.h
//  jiyiwangluo
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol afHttpDelegate <NSObject>

@optional

-(void)parsingWithGET:(id)result;

-(void)parsingWithPOST:(id)result;

-(void)parsingFailedWithError:(NSError *)error;

@end


@interface AFHttpManager : NSObject


@property (nonatomic ,assign)id<afHttpDelegate> delegate;

-(void)downloadDataWithGETUrl:(NSString *)url;

-(void)downloadDataWithPOSTUrl:(NSString *)url dic:(NSDictionary *)dic;



@end
