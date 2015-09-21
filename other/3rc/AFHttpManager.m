//
//  AFHttpManager.m
//  jiyiwangluo
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AFHttpManager.h"
#import "AFNetworking.h"

@implementation AFHttpManager

-(void)downloadDataWithGETUrl:(NSString *)url
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([result isKindOfClass:[NSDictionary class]]) {
            if ([self.delegate respondsToSelector:@selector(parsingWithGET:)]) {
                [self.delegate parsingWithGET:result];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(parsingFailedWithError:)]) {
            [self.delegate parsingFailedWithError:error];
        }
    }];
}

-(void)downloadDataWithPOSTUrl:(NSString *)url dic:(NSDictionary *)dic
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters: dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([result isKindOfClass:[NSDictionary class]]) {
            if ([self.delegate respondsToSelector:@selector(parsingWithPOST:)]) {
                [self.delegate parsingWithPOST:result];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(parsingFailedWithError:)]) {
            [self.delegate parsingFailedWithError:error];
        }
    }];
    
}
@end


