//
//  ZWWMineViewController.m
//  框架搭建
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWMineViewController.h"
#import "ZWWMineMessageTabView.h"
#import "ZWWMineMessageHeadView.h"
#import "ZWWResignViewController.h"
@interface ZWWMineViewController ()

@property (nonatomic, strong) ZWWMineMessageHeadView    *headView;
@property (nonatomic, strong) ZWWMineMessageTabView     *messageTab;


@end

@implementation ZWWMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = MainColor;
    
    
    [self.view addSubview:self.headView];
    [self.view addSubview:self.messageTab];
    [self addAutoLayout];

}

- (void)addAutoLayout{
    __weak typeof (self)weakself = self;
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(weakself.view);
        make.height.mas_equalTo(150);
    }];
    
    [self.messageTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.headView.mas_bottom).offset(35);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44*4);
    }];
}

#pragma set
- (ZWWMineMessageHeadView *)headView{
    if (!_headView) {
        _headView = [[ZWWMineMessageHeadView alloc]init];
        __weak typeof (self)wealkself = self;
        _headView.btnBlock = ^{
            ZWWResignViewController *resignVC = [[ZWWResignViewController alloc]init];
            [wealkself.navigationController pushViewController:resignVC animated:YES];
        };
    }
    return _headView;
}


- (ZWWMineMessageTabView *)messageTab{
    if (!_messageTab) {
        _messageTab = [[ZWWMineMessageTabView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _messageTab.separatorStyle = NO;//隐藏
    }
    return _messageTab;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
