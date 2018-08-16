//
//  ZWWThirdLoginView.m
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWThirdLoginView.h"

@interface ZWWThirdLoginView ()

@property (nonatomic, strong) UILabel            *oneLoginLB;
@property (nonatomic, strong) UILabel            *lineLB;
@property (nonatomic, strong) UIButton           *qqBtn;
@property (nonatomic, strong) UIButton           *wexinBtn;
@property (nonatomic, strong) UIButton           *weboBtn;

@end

@implementation ZWWThirdLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.lineLB];
        [self addSubview:self.oneLoginLB];
        [self addSubview:self.qqBtn];
        [self addSubview:self.wexinBtn];
        [self addSubview:self.weboBtn];
       
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof (self)weakself = self;
    [_oneLoginLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself);
        make.centerX.mas_equalTo(weakself.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_lineLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakself.mas_left).offset(15);
        make.right.mas_equalTo(weakself.mas_right).offset(-15);
        make.height.mas_equalTo(1.0);
        make.centerY.mas_equalTo(_oneLoginLB);
    }];
    
    [_wexinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.oneLoginLB.mas_bottom).offset(15);
        make.centerX.mas_equalTo(weakself.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [_qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_wexinBtn);
        make.centerX.mas_equalTo(_wexinBtn.mas_centerX).offset(-120);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [_weboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_wexinBtn);
        make.centerX.mas_equalTo(_wexinBtn.mas_centerX).offset(120);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
}

- (UILabel *)oneLoginLB{
    if (!_oneLoginLB) {
        _oneLoginLB = [[UILabel alloc]init];
        _oneLoginLB.textAlignment = NSTextAlignmentCenter;
        _oneLoginLB.text = @"一键登录";
        _oneLoginLB.font = [UIFont systemFontOfSize:14.0];
        _oneLoginLB.textColor = RGB(132, 132, 132);
        _oneLoginLB.backgroundColor = MainColor;
    }
    return _oneLoginLB;
}

- (UILabel *)lineLB{
    if (!_lineLB) {
        _lineLB = [[UILabel alloc]init];
        _lineLB.backgroundColor = RGB(188, 188, 188);

    }
    return _lineLB;
}

- (UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqBtn setImage:[UIImage imageNamed:@"third_qq"] forState:UIControlStateNormal];
        
    }
    return _qqBtn;
}

- (UIButton *)wexinBtn{
    if (!_wexinBtn) {
        _wexinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wexinBtn setImage:[UIImage imageNamed:@"third_friends"] forState:UIControlStateNormal];
        
    }
    return _wexinBtn;
}

- (UIButton *)weboBtn{
    if (!_weboBtn) {
        _weboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weboBtn setImage:[UIImage imageNamed:@"third_sina"] forState:UIControlStateNormal];
        
    }
    return _weboBtn;
}

@end
