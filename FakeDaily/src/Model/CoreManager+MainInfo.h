//
//  CoreManager+MainInfo.h
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "CoreManager.h"

@interface CoreManager (MainInfo)

+ (void)getLaunchImageWithSize:(NSString *)size
                       success:(RequestSuccess)success
                       failure:(RequestFailure)failure;

@end
