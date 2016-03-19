//
//  GlobalDefinition.h
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#pragma once
#import <Foundation/Foundation.h>

#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenBounds [UIScreen mainScreen].bounds

#define KeyWindow [[UIApplication sharedApplication] keyWindow]
#define TopView  [[UIApplication sharedApplication] keyWindow].rootViewController.view

#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue)         [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define IP_HEADER @"http://news-at.zhihu.com/api/4/"
#define TimeoutInterval 20.0 // 请求超时时间

#define RequestGET @"GET"
#define RequestPOST @"POST"

#ifndef LogE
#ifdef DEBUG
#define LogE(...) NSLog(@"错误信息:%@",__VA_ARGS__);
#else
#define LogE(...)
#endif
#endif

#ifndef LogI
#ifdef DEBUG
#define LogI(...) NSLog(@"普通信息:%@",__VA_ARGS__);
#else
#define LogI(...)
#endif
#endif

#define QuickBlock(block, params) \
if (block) {\
    block(params);\
}

#define WS(weakSelf) __weak typeof(self) weakSelf = self;

typedef void(^RequestSuccess)(id json);
typedef void(^RequestFailure)(NSError *error);

typedef NS_ENUM(NSUInteger, HttpMethod)
{
    Http_Method_Get,
    Http_Method_Post,
    Http_Method_Put,
    Http_Method_Delete
};