//
//  ZWWResignNextViewController.m
//  框架搭建
//
//  Created by mac on 2018/3/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWResignNextViewController.h"
#import "ZWWResignNextView.h"
#import <AFNetworking.h>

@interface ZWWResignNextViewController ()

@property (nonatomic, strong) ZWWResignNextView *resignNextView;

@end

@implementation ZWWResignNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZWWLog(@"传递的参==%@**%@",self.paramDic[@"userName"],self.paramDic[@"pwd"]);
    
    self.title = @"下一步";
    self.view.backgroundColor = MainColor;
    self.edgesForExtendedLayout = 0;
    [self addControl];
    [self requestData];
    
}

- (void)addControl{
    [self.view addSubview:self.resignNextView];
    
    __weak typeof (self)weakself = self;
    [self.resignNextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.view);
        make.left.right.mas_equalTo(weakself.view);
        make.height.mas_equalTo(150);
        
    }];
}

- (ZWWResignNextView *)resignNextView{
    if (!_resignNextView) {
        _resignNextView = [[ZWWResignNextView alloc]init];
        _resignNextView.phoneStr = self.paramDic[@"userName"];
        
    }
    return _resignNextView;
}


- (void)requestData{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager POST:@"http://123.57.141.249:8080/beautalk/appMember/createCode.do" parameters:@{@"MemeberId":self.paramDic[@"userName"]} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ZWWLog(@"responseObject==%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZWWLog(@"error==%@",error);
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
