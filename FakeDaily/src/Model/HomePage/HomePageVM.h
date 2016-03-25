//
//  HomePageVM.h
//  FakeDaily
//
//  Created by BOOM on 16/3/24.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^requestFinish)();
@class SingleNewsModel;
@interface HomePageVM : NSObject

@property (copy, nonatomic) NSString *currentDay;

@property (strong, nonatomic) NSMutableArray *newsIDs;

- (void)requestLatestNews:(requestFinish)finish;

- (void)requestPreviousNews:(requestFinish)finish;

- (NSAttributedString *)headerTitleForSection:(NSInteger)section;

- (NSString *)dateForSection:(NSInteger)section;

- (NSUInteger)numberOfSections;

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

- (NSMutableArray *)autoloopData;

- (SingleNewsModel *)singleModelForIndexPath:(NSIndexPath *)indexPath;

@end
