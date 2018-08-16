//
//  ZWWResignTextInputView.h
//  框架搭建
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NextBtnBlock) (NSDictionary *dic);

@interface ZWWResignTextInputView : UIView

@property (nonatomic, copy) NextBtnBlock  nextBtnBlock;

@end
