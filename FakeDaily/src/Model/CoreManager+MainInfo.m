//
//  CoreManager+MainInfo.m
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "CoreManager+MainInfo.h"

@implementation CoreManager (MainInfo)

+ (void)getLaunchImageWithSize:(NSString *)size
                       success:(RequestSuccess)success
                       failure:(RequestFailure)failure
{
    NSString *appendStr = [NSString stringWithFormat:@"start-image/%@", size];
    [CoreManager reqWithMethod:Http_Method_Get
                           url:appendStr
                        params:nil
                         class:nil
                       success:^(id data) {
       
                           success(data);
                       } failure:^(NSError *error) {
        
                           failure(error);
                       }];
}

+ (void)getMainViewNewsWithField:(NSString *)field
                         success:(RequestMainInfoSuccess)success
                         failure:(RequestFailure)failure
{
    [CoreManager reqWithMethod:Http_Method_Get
                           url:[NSString stringWithFormat:@"news/%@", field]
                        params:nil
                         class:NSClassFromString(@"LatestNewsModel")
                       success:^(id data) {
                           success(data);
                       } failure:^(NSError *error) {
                           failure(error);
                       }];
}

+ (void)getPreviousNewsWithDate:(NSString *)date
                        success:(RequestMainInfoSuccess)success
                        failure:(RequestFailure)failure
{
    [CoreManager reqWithMethod:Http_Method_Get
                           url:[NSString stringWithFormat:@"news/before/%@", date]
                        params:nil
                         class:NSClassFromString(@"LatestNewsModel")
                       success:^(id data) {
                           success(data);
                       } failure:^(NSError *error) {
                           failure(error);
                       }];
}

@end
