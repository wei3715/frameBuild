//
//  ZWWResignTextInputView.m
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWResignTextInputView.h"
#import "ZWWResignTextInputView.h"
#import "ZWWThirdLoginView.h"

@interface ZWWResignTextInputView ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel                   *tostLB;
@property (nonatomic, strong) UITextField               *userTF;
@property (nonatomic, strong) UITextField               *pwdTF;
@property (nonatomic, strong) UIButton                  *nextBtn;
@property (nonatomic, strong) UIButton                  *goLoginBtn;
@property (nonatomic, strong) UILabel                   *backLineLB;
@property (nonatomic, strong) UILabel                   *midLineLB;

@end

@implementation ZWWResignTextInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        [self addSubview:self.tostLB];
        [self addSubview:self.backLineLB];
        [self.backLineLB addSubview:self.midLineLB];
        [self.backLineLB addSubview:self.userTF];
        [self.backLineLB addSubview:self.pwdTF];
        [self addSubview:self.nextBtn];
        [self addSubview:self.goLoginBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof (self)weakself = self;
    [_tostLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(weakself);
        make.left.mas_equalTo(weakself).offset(MainMargin);
        make.height.mas_equalTo(44);
    }];
    
    [_backLineLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_tostLB.mas_bottom);
        make.height.mas_equalTo(89);
        make.left.mas_equalTo(weakself.mas_left).offset(-1);
        make.right.mas_equalTo(weakself.mas_right).offset(1);
    }];
    
    [_midLineLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(_backLineLB.mas_centerY);
        make.left.mas_equalTo(_backLineLB.mas_left).offset(15);
        make.right.mas_equalTo(_backLineLB.mas_right).offset(-15);
    }];
    
    [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.backLineLB.mas_top).offset(1);
        make.left.mas_equalTo(weakself.backLineLB.mas_left).offset(16);
        make.right.mas_equalTo(weakself.backLineLB.mas_right).offset(-1);
        make.bottom.mas_equalTo(weakself.midLineLB.mas_top);
    }];
    
    [_pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.midLineLB.mas_bottom);
        make.left.mas_equalTo(weakself.backLineLB.mas_left).offset(16);
        make.right.mas_equalTo(weakself.backLineLB.mas_right).offset(-1);
        make.bottom.mas_equalTo(weakself.backLineLB.mas_bottom).offset(-1);
    }];
    
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_backLineLB.mas_bottom).offset(15);
        make.left.mas_equalTo(weakself.mas_left).offset(15);
        make.right.mas_equalTo(weakself.mas_right).offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    [_goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nextBtn.mas_bottom).offset(15);
        make.right.mas_equalTo(weakself.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
}

#pragma get
- (UILabel *)tostLB{
    if (!_tostLB) {
        _tostLB = [[UILabel alloc]init];
        _tostLB.font = [UIFont systemFontOfSize:14.0];
        _tostLB.text = @"请输入手机号码注册新用户";
        _tostLB.textColor = TextColor;
    }
    return _tostLB;
}

- (UILabel *)backLineLB{
    if (!_backLineLB) {
        _backLineLB = [[UILabel alloc]init];
        _backLineLB.layer.borderWidth = 1.0;
        _backLineLB.backgroundColor = [UIColor whiteColor];
        _backLineLB.layer.borderColor = RGB(188, 188, 188).CGColor;
        _backLineLB.userInteractionEnabled = YES;
    }
    return _backLineLB;
}

- (UILabel *)midLineLB{
    if (!_midLineLB) {
        _midLineLB = [[UILabel alloc]init];
        _midLineLB.backgroundColor = RGB(188, 188, 188);
    }
    return _midLineLB;
}

- (UITextField *)userTF{
    if (!_userTF) {
        _userTF = [[UITextField alloc]init];
        _userTF.placeholder = @"请输入手机号码";
        _userTF.textColor = TextColor;
        _userTF.delegate = self;
        _userTF.keyboardType = UIKeyboardTypeNumberPad;
        [_userTF addTarget:self action:@selector(userTextChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _userTF;
}

- (UITextField *)pwdTF{
    if (!_pwdTF) {
        _pwdTF = [[UITextField alloc]init];
        _pwdTF.placeholder = @"设置账号密码";
        _pwdTF.textColor = TextColor;
        _pwdTF.delegate = self;
        _pwdTF.secureTextEntry = YES;
        [_pwdTF addTarget:self action:@selector(pwdTextChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _pwdTF;
}

- (UIButton *)nextBtn{
    if(!_nextBtn){
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:RGB(132, 132, 132) forState:UIControlStateNormal];
        _nextBtn.backgroundColor = RGB(229, 229, 229);
        [_nextBtn addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _nextBtn.userInteractionEnabled = NO;
        _nextBtn.selected = NO;
    }
    return _nextBtn;
}

- (UIButton *)goLoginBtn{
    if (!_goLoginBtn) {
        _goLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goLoginBtn setTitle:@"去登陆" forState:UIControlStateNormal];
        [_goLoginBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _goLoginBtn;
}

#pragma action
-(void)userTextChanged:(UITextField *)textField{
    if (textField.text.length == 11 && _pwdTF.text.length == 6) {
         [_nextBtn setBackgroundColor:RGB(56, 166, 241)];
         _nextBtn.userInteractionEnabled = YES;
         _nextBtn.selected = YES;
    } else {
        
         [_nextBtn setBackgroundColor:RGB(229, 229, 229)];
         _nextBtn.userInteractionEnabled = NO;
         _nextBtn.selected = NO;
    }
}

-(void)pwdTextChanged:(UITextField *)textField{
    if (textField.text.length == 6 && _userTF.text.length == 11) {
        [_nextBtn setBackgroundColor:RGB(56, 166, 241)];
        _nextBtn.userInteractionEnabled = YES;
         _nextBtn.selected = YES;
    } else {
        [_nextBtn setBackgroundColor:RGB(229, 229, 229)];
        _nextBtn.userInteractionEnabled = NO;
         _nextBtn.selected = NO;
    }
}

- (void)pushNextVC{
    if (self.nextBtnBlock) {
        self.nextBtnBlock(@{@"userName":_userTF.text,@"pwd":_pwdTF.text});
    }
}


#pragma delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == _userTF) {
        if (range.location>10) {
            return NO;
        }
    } else if (textField == _pwdTF) {
        if (range.location>5) {
            return NO;
        }
    }
    
    return YES;
}



@end
