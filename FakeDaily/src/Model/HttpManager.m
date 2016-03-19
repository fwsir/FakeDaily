//
//  HttpManager.m
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "HttpManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation HttpManager

+ (void)requestWithMethod:(HttpMethod)method
                  baseUrl:(NSString *)baseUrl
                      url:(NSString *)url
                   params:(NSDictionary *)params
                  success:(RequestSuccess)success
                  failure:(RequestFailure)failure
{
    NSURL *reqUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", baseUrl, url]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    switch (method)
    {
        case Http_Method_Get:
        {
            [manager GET:reqUrl.absoluteString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                QuickBlock(success, responseObject)
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                LogE(error);
                QuickBlock(failure, error)
            }];
        }
            break;
        case Http_Method_Put:
        {
            [manager PUT:reqUrl.absoluteString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                QuickBlock(success, responseObject)
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                LogE(error);
                QuickBlock(failure, error)
            }];
        }
            break;
        case Http_Method_Post:
        {
            [manager POST:reqUrl.absoluteString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                QuickBlock(success, responseObject)
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                LogE(error);
                QuickBlock(failure, error)
            }];
        }
            break;
        case Http_Method_Delete:
        {
            [manager DELETE:reqUrl.absoluteString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                QuickBlock(success, responseObject)
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                QuickBlock(failure, error)
            }];
        }
            break;
            
        default:
        {
            assert(0);
        }
            break;
    }
    
}

@end
