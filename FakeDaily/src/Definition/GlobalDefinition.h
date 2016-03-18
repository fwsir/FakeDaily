//
//  GlobalDefinition.h
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#pragma once

#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenBounds [UIScreen mainScreen].bounds

#define kKeyWindow [[UIApplication sharedApplication] keyWindow]
#define kTopView  [[UIApplication sharedApplication] keyWindow].rootViewController.view

#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue)         [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
