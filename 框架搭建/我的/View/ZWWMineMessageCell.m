//
//  ZWWMineMessageCell.m
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWMineMessageCell.h"

@interface ZWWMineMessageCell()

@property (nonatomic, strong) UIImageView        *leftIV;
@property (nonatomic, strong) UILabel            *titleLB;
@property (nonatomic, strong) UIImageView        *nextIV;
@property (nonatomic, strong) UILabel            *lineLB;

@end

@implementation ZWWMineMessageCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftIV];
        [self.contentView addSubview:self.titleLB];
         [self.contentView addSubview:self.nextIV];
         [self.contentView addSubview:self.lineLB];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof (self)weakself = self;
    [_leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakself.mas_left).offset(MainMargin);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakself.leftIV.mas_right).offset(MainMargin);
        make.size.mas_equalTo(CGSizeMake(140, 15));
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    
    [_nextIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakself.mas_right).offset(-MainMargin);
        make.size.mas_equalTo(CGSizeMake(10, 14));
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    
    [_lineLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakself.titleLB.mas_left);
        make.right.mas_equalTo(weakself.mas_right);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(weakself.mas_bottom);
    }];
}

- (UIImageView *)leftIV{
    if (!_leftIV) {
        _leftIV = [[UIImageView alloc]init];
    }
    return _leftIV;
}

- (UILabel *)titleLB{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc]init];
        _titleLB.font = [UIFont systemFontOfSize:15.0];
        _titleLB.textColor = [UIColor blackColor];
    }
    return _titleLB;
}

- (UILabel *)lineLB{
    if (!_lineLB) {
        _lineLB = [[UILabel alloc]init];
        _lineLB.backgroundColor = MainColor;
    }
    return _lineLB;
}

- (UIImageView *)nextIV{
    if (!_nextIV) {
        _nextIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mine_next"]];
    }
    return _nextIV;
}

- (void)setDataDic:(NSDictionary *)dataDic{
    _leftIV.image = [UIImage imageNamed:dataDic[@"leftImage"]];
    _titleLB.text = dataDic[@"title"];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
