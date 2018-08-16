//
//  ZWWMineMessageHeadView.m
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWMineMessageHeadView.h"

@interface ZWWMineMessageHeadView ()

@property (nonatomic, strong) UIImageView               *headBgIV;
@property (nonatomic, strong) UIButton                  *loginBtn;
@property (nonatomic, strong) UIButton                  *resignBtn;

@end


@implementation ZWWMineMessageHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headBgIV];
        [self addSubview:self.loginBtn];
        [self addSubview:self.resignBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof (self)weakself = self;
    [self.headBgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakself.mas_centerX).offset(-60);
        make.centerY.mas_equalTo(weakself);
        make.size.mas_equalTo(CGSizeMake(80, 50));
    }];
    
    [self.resignBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakself.mas_centerX).offset(60);
        make.centerY.mas_equalTo(weakself);
        make.size.mas_equalTo(CGSizeMake(80, 50));
    }];
}

- (UIImageView *)headBgIV{
    if (!_headBgIV) {
        _headBgIV = [[UIImageView alloc]init];
        _headBgIV.backgroundColor = [UIColor purpleColor];
    }
    return _headBgIV;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _loginBtn;
}

- (UIButton *)resignBtn{
    if (!_resignBtn) {
        _resignBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resignBtn setTitle:@"注册" forState:UIControlStateNormal];
        _resignBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [_resignBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_resignBtn addTarget:self action:@selector(resignBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resignBtn;
}


- (void)resignBtnAction:(UIButton *)btn{
    if (self.btnBlock) {
        self.btnBlock();
    }
}

@end
