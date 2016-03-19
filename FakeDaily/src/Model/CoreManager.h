//
//  CoreManager.h
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreManager : NSObject

+ (instancetype)shareInstance;

+ (void)reqWithMethod:(HttpMethod)method
                  url:(NSString *)url
               params:(NSDictionary *)params
                class:(Class)cls
              success:(RequestSuccess)success
              failure:(RequestFailure)failure;

@end
