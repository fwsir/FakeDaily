//
//  SingleNewsModel.h
//  FakeDaily
//
//  Created by BOOM on 16/3/24.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleNewsModel : NSObject

@property (nonatomic, copy) NSArray *imagesUrl;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *newsType;
@property (nonatomic, copy) NSString *newsID;
@property (nonatomic, copy) NSString *prefix;
@property (nonatomic, copy) NSString *newsTitle;

@end
