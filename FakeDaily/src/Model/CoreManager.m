//
//  CoreManager.m
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "CoreManager.h"
#import "HttpManager.h"
#import <NSObject+MJKeyValue.h>

@implementation CoreManager

+ (instancetype)shareInstance
{
    static CoreManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreManager alloc] init];
    });
    
    return instance;
}

+ (void)reqWithMethod:(HttpMethod)method
                  url:(NSString *)url
               params:(NSDictionary *)params
                class:(Class)cls
              success:(RequestSuccess)success
              failure:(RequestFailure)failure
{
    [HttpManager requestWithMethod:method baseUrl:IP_HEADER url:url params:params success:^(id json) {

        QuickBlock(success, json)
    } failure:failure];
}

@end
