//
//  ZWWHttpManager.h
//  框架搭建
//
//  Created by mac on 2018/3/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^requestSuccessBlock)(id responseObject);
typedef void(^requestFailBlock)(NSError *error);

@interface ZWWHttpManager : AFHTTPSessionManager 
+(instancetype)shareManager;
+(void)getDtaWithUrl:(NSString *)urlStr paramDic:(NSDictionary *)paramDic success:(requestSuccessBlock)success fail:(requestFailBlock)fail;
+(void)postDtaWithUrl:(NSString *)urlStr paramDic:(NSDictionary *)paramDic success:(requestSuccessBlock)success fail:(requestFailBlock)fail;

@end
