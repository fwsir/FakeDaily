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
             @"imagesUrl":@"imagesUrl",
             @"imageUrl":@"imageUrl",
             @"newsType":@"newsType",
             @"newsID":@"newsID",
             @"prefix":@"prefix",
             @"newsTitle":@"newsTitle"
             };
}

@end
