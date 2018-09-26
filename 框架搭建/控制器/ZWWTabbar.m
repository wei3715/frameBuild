//
//  ZWWTabbar.m
//  框架搭建
//
//  Created by Jolly on 2018/9/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWTabbar.h"
@interface ZWWTabbar ()

@property (nonatomic, strong) UIButton *centerBtn;

@end

@implementation ZWWTabbar

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat tabbarW = self.bounds.size.width;
    CGFloat tabbarH = self.bounds.size.height;
    CGFloat btnX, btnY = 0;
    CGFloat btnW = tabbarW/5.0;
    CGFloat btnH = tabbarH;
    
    int i = 0;
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i==2) {
                i = 3;
            }
            
            btnX = i*btnW;
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        }
    }
    
    self.centerBtn.center = CGPointMake(tabbarW*0.5, tabbarH*0.5);
    CGRect centerFrame = self.centerBtn.frame;
    centerFrame.origin.y -= 40;
    self.centerBtn.frame = centerFrame;
    [self bringSubviewToFront:self.centerBtn];

}

- (UIButton *)centerBtn{
    if (!_centerBtn) {
        _centerBtn = [[UIButton alloc]init];
        [_centerBtn setImage:[UIImage imageNamed:@"tab_more_normal"] forState:UIControlStateNormal];
        [_centerBtn setImage:[UIImage imageNamed:@"tab_more_press"] forState:UIControlStateSelected];
        [_centerBtn addTarget:self action:@selector(centerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_centerBtn sizeToFit];
        [self addSubview:self.centerBtn];
    }
    return _centerBtn;
}

//解决超出tabbar范围不能响应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO) { // 当前界面 tabBar显示
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) { // 点 属于按钮范围
            return self.centerBtn;
            
        } else {
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

- (void)centerBtnAction:(UIButton *)btn{
    ZWWLog(@"点击了中间按钮 ");
}

@end
