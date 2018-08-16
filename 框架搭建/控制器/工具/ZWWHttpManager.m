//
//  ZWWHttpManager.m
//  框架搭建
//
//  Created by mac on 2018/3/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWHttpManager.h"

@implementation ZWWHttpManager

+(instancetype)shareManager{
    static ZWWHttpManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZWWHttpManager manager]initWithBaseURL:[NSURL URLWithString:@"http://123.57.141.249:8080/beautalk/"]];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });
    return manager;
}

+(void)getDtaWithUrl:(NSString *)urlStr paramDic:(NSDictionary *)paramDic success:(requestSuccessBlock)success fail:(requestFailBlock)fail{
    [[ZWWHttpManager shareManager]GET:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
    
}

+(void)postDtaWithUrl:(NSString *)urlStr paramDic:(NSDictionary *)paramDic success:(requestSuccessBlock)success fail:(requestFailBlock)fail{
    [[ZWWHttpManager shareManager]POST:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}

@end
