//
//  LeftDataModel.m
//  FakeDaily
//
//  Created by BOOM on 16/3/21.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "LeftDataModel.h"

@implementation LeftDataModel

- (id)init
{
    if (self = [super init])
    {
        _leftList = @[@"首页", @"动漫日报", @"日常心理学", @"用户推荐日报", @"电影日报", @"不许无聊", @"设计日报", @"大公司日报", @"财经日报", @"互联网安全", @"开始游戏", @"音乐日报", @"体育日报"];
    }
    
    return self;
}

@end
