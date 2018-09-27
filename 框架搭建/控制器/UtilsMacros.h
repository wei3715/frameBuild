//
//  UtilsMacros.h
//  框架搭建
//
//  Created by Jolly on 2018/9/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

#define RGB(r,g,b)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define MainColor       [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0]

#define TextColor       RGB(81, 81, 81)

#define MainMargin      15
#define KScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight   [[UIScreen mainScreen] bounds].size.height

#ifdef DEBUG   //开发调试模式
#define ZWWLog(...) NSLog(__VA_ARGS__) //ZWWLog是不限制参数个数的，中间用...表示
#elif
#define ZWWLog(...)
#endif

#endif /* UtilsMacros_h */
