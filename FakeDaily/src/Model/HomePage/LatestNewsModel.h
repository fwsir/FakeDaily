//
//  LatestNewsModel.h
//  FakeDaily
//
//  Created by BOOM on 16/3/24.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LatestNewsModel : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, strong) NSMutableArray *stories;
@property (nonatomic, strong) NSMutableArray *topStories;

@end
