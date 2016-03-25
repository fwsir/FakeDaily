//
//  SingleNewsModel.m
//  FakeDaily
//
//  Created by BOOM on 16/3/24.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "SingleNewsModel.h"

@implementation SingleNewsModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"imagesUrl":@"images",
             @"imageUrl":@"image",
             @"newsType":@"type",
             @"newsID":@"id",
             @"prefix":@"ga_prefix",
             @"newsTitle":@"title"
             };
}

@end
