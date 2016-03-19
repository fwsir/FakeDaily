//
//  HttpManager.h
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject

+ (void)requestWithMethod:(HttpMethod)method
                  baseUrl:(NSString *)baseUrl
                      url:(NSString *)url
                   params:(NSDictionary *)params
                  success:(RequestSuccess)success
                  failure:(RequestFailure)failure;

@end
