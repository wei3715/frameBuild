//
//  ZWWNaviViewController.m
//  框架搭建
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWNaviViewController.h"

@interface ZWWNaviViewController ()

@end

@implementation ZWWNaviViewController

//保证对navi设置执行一次，节省
+ (void)initialize{
    UINavigationBar *navibar = [UINavigationBar appearance];
    [navibar setBarTintColor:[UIColor redColor]];
    [navibar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    [navibar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor grayColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0, 0, 30, 30);
        [leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
        viewController.navigationItem.leftBarButtonItem = leftItem;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)backAction{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
