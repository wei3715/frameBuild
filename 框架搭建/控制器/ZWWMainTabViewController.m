//
//  ZWWMainTabViewController.m
//  框架搭建
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWMainTabViewController.h"
#import "ZWWNaviViewController.h"
#import "ZWWTabbar.h"
@interface ZWWMainTabViewController ()

@property (nonatomic, strong)NSArray  *dataArr;

@end

@implementation ZWWMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //使用系统的UITabbar
//    UITabBarItem *tabItem = [UITabBarItem appearance];
//    [tabItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
//    [tabItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    //使用自定义的Tabbar
    ZWWTabbar *tabbar = [[ZWWTabbar alloc]initWithFrame:self.tabBar.frame];
    tabbar.backgroundColor = [UIColor clearColor];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    for (NSDictionary *dic in self.dataArr) {
        Class className = NSClassFromString(dic[@"tabVC"]);
        UIViewController *vc = [[className alloc]init];
        vc.tabBarItem.image = [UIImage imageNamed:dic[@"tabNormalImage"]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:dic[@"tabSelectImage"]];
        vc.title = dic[@"tabTitle"];
        
        ZWWNaviViewController *navi = [[ZWWNaviViewController alloc]initWithRootViewController:vc];
        [self addChildViewController:navi];
    }
    
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TabPlist" ofType:@"plist"]];
    }
    return _dataArr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
