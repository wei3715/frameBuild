//
//  ZWWMineMessageTabView.m
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWMineMessageTabView.h"
#import "ZWWMineMessageCell.h"

@interface ZWWMineMessageTabView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray       *dataArr;

@end

@implementation ZWWMineMessageTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
     
        self.delegate = self;
        self.dataSource = self;
        self.bounces = 0;
    }
    return self;
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ZWWMineMesaageTableList" ofType:@"plist"]];
    }
    return _dataArr;
}

#pragma delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWWLog(@"点击的第%ld行",indexPath.row);
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellId";
    ZWWMineMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ZWWMineMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.dataDic = self.dataArr[indexPath.row];
    if (indexPath.row == 3) {
        UIImageView *nextIV = [cell valueForKey:@"nextIV"];
        nextIV.hidden = YES;
        
        __weak typeof (cell)weakCell = cell;
        UILabel *phoneLB = [[UILabel alloc]init];
        phoneLB.textColor = [UIColor grayColor];
        phoneLB.text = @"400-2345-7896";
        [cell.contentView addSubview:phoneLB];
        [phoneLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(weakCell).offset(-MainMargin);
            make.size.mas_equalTo(CGSizeMake(140, 15));
            make.centerY.mas_equalTo(weakCell);
        }];
    }
    return cell;
}


@end
