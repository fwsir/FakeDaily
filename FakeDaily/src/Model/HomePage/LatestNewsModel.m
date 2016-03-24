//
//  LatestNewsModel.m
//  FakeDaily
//
//  Created by BOOM on 16/3/24.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "LatestNewsModel.h"
#import "SingleNewsModel.h"

@implementation LatestNewsModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"date":@"date",
             @"stories":@"stories",
             @"topStories":@"topStories"
             };
}

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"stories":[SingleNewsModel class],
             @"TopStories":[SingleNewsModel class]
             };
}

@end
