//
//  ZWWResignViewController.m
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWResignViewController.h"
#import "ZWWResignTextInputView.h"
#import "ZWWThirdLoginView.h"
#import "ZWWResignNextViewController.h"
@interface ZWWResignViewController ()

@property (nonatomic, strong) ZWWResignTextInputView    *inputView;
@property (nonatomic, strong) ZWWThirdLoginView         *loginView;

@end

@implementation ZWWResignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"注册";
    self.view.backgroundColor = MainColor;
    self.edgesForExtendedLayout = 0;
    
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.loginView];
    [self addAutoLayout];
}

- (void)addAutoLayout{
    __weak typeof (self)weakself = self;
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(weakself.view);
        make.height.mas_equalTo(270);
    }];
    
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.inputView.mas_bottom);
        make.left.right.mas_equalTo(weakself.view);
        make.height.mas_equalTo(100);
    }];
}

- (ZWWResignTextInputView *)inputView{
    if (!_inputView) {
        _inputView = [[ZWWResignTextInputView alloc]init];
        __weak typeof(self)weakself = self;
        _inputView.nextBtnBlock = ^(NSDictionary *dic) {
            ZWWResignNextViewController *resignNextVC = [[ZWWResignNextViewController alloc]init];
            resignNextVC.paramDic = dic;
            [weakself.navigationController pushViewController:resignNextVC animated:YES];
        };
    }
    return _inputView;
}

- (ZWWThirdLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[ZWWThirdLoginView alloc]init];
    }
    return _loginView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
