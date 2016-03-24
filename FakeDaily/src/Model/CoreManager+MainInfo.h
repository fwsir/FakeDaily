//
//  CoreManager+MainInfo.h
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "CoreManager.h"
#import "LatestNewsModel.h"

typedef void(^RequestMainInfoSuccess)(LatestNewsModel *);
@interface CoreManager (MainInfo)

+ (void)getLaunchImageWithSize:(NSString *)size
                       success:(RequestSuccess)success
                       failure:(RequestFailure)failure;

+ (void)getMainViewNewsWithField:(NSString *)field
                         success:(RequestMainInfoSuccess)success
                         failure:(RequestFailure)failure;

+ (void)getPreviousNewsWithDate:(NSString *)date
                        success:(RequestMainInfoSuccess)success
                        failure:(RequestFailure)failure;

@end
