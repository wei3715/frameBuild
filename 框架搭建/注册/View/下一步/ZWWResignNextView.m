//
//  ZWWResignNextView.m
//  框架搭建
//
//  Created by mac on 2018/3/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWResignNextView.h"

@interface ZWWResignNextView ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel                   *tostLB;
@property (nonatomic, strong) UITextField               *pwdTF;
@property (nonatomic, strong) UIButton                  *timeBtn;
@property (nonatomic, strong) UIButton                  *resignBtn;
@property (nonatomic, strong) UILabel                   *backLineLB;
@property (nonatomic, strong) UILabel                   *midLineLB;

@end

@implementation ZWWResignNextView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLB];
        [self addSubview:self.backLineLB];
        [self.backLineLB addSubview:self.pwdTF];
        [self.backLineLB addSubview:self.timeBtn];
        [self.backLineLB addSubview:self.midLineLB];
        [self addSubview:self.resignBtn];
        [self GCDTime];
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
        make.height.mas_equalTo(44);
        make.left.mas_equalTo(weakself.mas_left).offset(-1);
        make.right.mas_equalTo(weakself.mas_right).offset(1);
    }];
    
    [_midLineLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(1, 35));
        make.centerY.mas_equalTo(_backLineLB.mas_centerY);
        make.right.mas_equalTo(_backLineLB.mas_right).offset(-110);
    }];
    
    [_pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.backLineLB.mas_top).offset(1);
        make.left.mas_equalTo(weakself.backLineLB.mas_left).offset(16);
        make.right.mas_equalTo(weakself.midLineLB.mas_left);
        make.bottom.mas_equalTo(weakself.backLineLB.mas_bottom).offset(-1);
    }];
    
    [_timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.height.mas_equalTo(_backLineLB);
        make.left.mas_equalTo(_midLineLB.mas_right).offset(5.0);
    }];
    
    [_resignBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_backLineLB.mas_bottom).offset(MainMargin);
        make.left.mas_equalTo(weakself.mas_left).offset(MainMargin);
        make.right.mas_equalTo(weakself.mas_right).offset(-MainMargin);
        make.height.mas_equalTo(40);
    }];
    
    
}

#pragma get
- (UILabel *)tostLB{
    if (!_tostLB) {
        _tostLB = [[UILabel alloc]init];
        _tostLB.font = [UIFont systemFontOfSize:12.0];
        _tostLB.text = @"验证码已发送到 +86";
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

- (UITextField *)pwdTF{
    if (!_pwdTF) {
        _pwdTF = [[UITextField alloc]init];
        _pwdTF.placeholder = @"请输入验证码";
        _pwdTF.textColor = TextColor;
        _pwdTF.delegate = self;
        [_pwdTF addTarget:self action:@selector(pwdTextChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _pwdTF;
}

- (UIButton *)timeBtn{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_timeBtn setTitle:@"30秒后重试" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:TextColor forState:UIControlStateNormal];
        [_timeBtn addTarget:self action:@selector(GCDTime) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timeBtn;
}

- (UIButton *)resignBtn{
    if(!_resignBtn){
        _resignBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resignBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_resignBtn setTitleColor:RGB(139, 139, 139) forState:UIControlStateNormal];
        [_resignBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _resignBtn.backgroundColor = RGB(229, 229, 229);
        [_resignBtn addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
        _resignBtn.selected = NO;
        _resignBtn.userInteractionEnabled = NO;
    }
    return _resignBtn;
}

- (void)setPhoneStr:(NSString *)phoneStr{
    _phoneStr = phoneStr;
    
    [_tostLB setAttributedText:[self makeTostAttributeStr]];
    [_timeBtn setAttributedTitle:[self makeTimeAttributeStrWithStr:@"5"] forState:UIControlStateNormal];
}

- (NSMutableAttributedString *)makeTostAttributeStr{
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc]initWithString:@"验证码已发送到 " attributes:@{NSForegroundColorAttributeName:RGB(139, 139, 139) }];
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"+86 %@",_phoneStr] attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
    [str1 appendAttributedString:str2];
    return str1;
}

- (NSMutableAttributedString *)makeTimeAttributeStrWithStr:(NSString *)str{
    NSMutableAttributedString *str3 = [[NSMutableAttributedString alloc]initWithString:str attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
    NSMutableAttributedString *str4 = [[NSMutableAttributedString alloc]initWithString:@"秒后重试" attributes:@{NSForegroundColorAttributeName:RGB(139, 139, 139)}];
    [str3 appendAttributedString:str4];
    return str3;
}

#pragma action
-(void)pwdTextChanged:(UITextField *)textField{
    if (textField.text.length == 6) {
        [_resignBtn setBackgroundColor:RGB(56, 166, 241)];
        _resignBtn.userInteractionEnabled = YES;
        _resignBtn.selected = YES;
    } else {
        
        [_resignBtn setBackgroundColor:RGB(229, 229, 229)];
        _resignBtn.userInteractionEnabled = NO;
        _resignBtn.selected = NO;
    }
}


- (void)pushNextVC{
    
}

//1. 需要了解RunLoop的坑：
//- NSTimer
//日常开发中，我们与runLoop接触得最近可能就是通过NSTimer了。一个Timer一次只能加入到一个RunLoop中。我们日常使用的时候，通常就是加入到当前的runLoop的default mode中。
//
//提到mode,就需要谈谈RunLoop Modes
//简单的说，runLoop有多个Mode,RunLoop只能运行一个Mode,runLoop只会处理它当前Mode的事件。
//
//所以就会导致一些地方我们需要去注意。
//- 一般Timer是运行在RunLoop的default mode上，而ScrollView在用户滑动时，主线程RunLoop会转到UITrackingRunLoopMode。而这个时候，Timer就不会运行,方法得不到fire。

- (void)GCDTime{
    __weak typeof (self)weakself = self;
    __block NSInteger time = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (time<1) {

            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakself.timeBtn.userInteractionEnabled = YES;
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"重新发送" attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
                [weakself.timeBtn setAttributedTitle:str forState:UIControlStateNormal];
            });

        } else {

            dispatch_async(dispatch_get_main_queue(), ^{
                 weakself.timeBtn.userInteractionEnabled = NO;
                 [weakself.timeBtn setAttributedTitle:[self makeTimeAttributeStrWithStr:[NSString stringWithFormat:@"%li",time]] forState:UIControlStateNormal];
                 time --;

            });

        }
    });
    dispatch_resume(timer);
}

#pragma delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (range.location==6) {
        return NO;
    }
    return YES;
}
    

@end
