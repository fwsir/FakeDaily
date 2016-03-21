//
//  AppDelegate.m
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "AppDelegate.h"
#import "LaucherViewController.h"
#import "MainViewController.h"
#import "LeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:ScreenBounds];
    
    MainViewController *mc = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    LeftViewController *lvc = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    mc.leftVC = lvc;
    
    self.window.rootViewController = mc;
    [self.window makeKeyAndVisible];
    
    // 添加启动页面
    LaucherViewController *vc = [[LaucherViewController alloc] initWithNibName:@"LaucherViewController" bundle:nil];
    [self.window addSubview:vc.view];
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.window);
    }];
    
    return YES;
}

@end
