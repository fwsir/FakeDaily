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
    [CoreManager reqWithMethod:Http_Method_Get url:appendStr params:nil class:nil success:^(id json) {
       
        success(json);
    } failure:^(NSError *error) {
        
        failure(error);
    }];
}

@end
