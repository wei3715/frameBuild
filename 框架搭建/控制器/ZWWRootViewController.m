//
//  ZWWRootViewController.m
//  框架搭建
//
//  Created by Jolly on 2018/9/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWRootViewController.h"

@interface ZWWRootViewController ()

@end

@implementation ZWWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

@end
