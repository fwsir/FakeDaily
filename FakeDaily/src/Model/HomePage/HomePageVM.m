//
//  HomePageVM.m
//  FakeDaily
//
//  Created by BOOM on 16/3/24.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "HomePageVM.h"
#import "CoreManager+MainInfo.h"
#import "SingleNewsModel.h"

@implementation HomePageVM
{
    NSMutableArray *_listNews;
    NSMutableArray *_autoLoopNews;
    NSMutableArray *_dateList;
}

- (void)requestLatestNews:(requestFinish)finish
{
    [CoreManager getMainViewNewsWithField:@"latest" success:^(LatestNewsModel *model) {
        
        [_newsIDs removeAllObjects];
        _newsIDs = [NSMutableArray array];

        _currentDay = model.date;

        [_dateList removeAllObjects];
        _dateList = [NSMutableArray array];
        [_dateList addObject:_currentDay];
        
        NSMutableArray *listNews = [NSMutableArray array];
        [listNews addObjectsFromArray:model.stories];
        
        [_listNews removeAllObjects];
        _listNews = [NSMutableArray array];
        
        NSMutableArray *tmpNews = [NSMutableArray array];
        for (SingleNewsModel *singleModel in listNews)
        {
            [_newsIDs addObject:singleModel.newsID];
            
            [tmpNews addObject:singleModel];
            // SingleNewsLayout
        }
        [_listNews addObject:tmpNews];
        
        [_autoLoopNews removeAllObjects];
        _autoLoopNews = [NSMutableArray array];
        
        for (NSUInteger i = 0; i < model.stories.count; ++i) {
            
            // autoLoop
        }
        
        finish();
        
     } failure:^(NSError *error) {
    
    }];
}

- (void)requestPreviousNews:(requestFinish)finish
{
    [CoreManager getPreviousNewsWithDate:_currentDay success:^(LatestNewsModel *model) {
        
        _currentDay =model.date;
        [_dateList addObject:_currentDay];
        
//        NSMutableArray *listNewsArr = [[NSMutableArray alloc] init];
//        [listNewsArr addObjectsFromArray:newsModel.storiesArray];
//        
//        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//        for (WFSingelNewsModel *singeModel in listNewsArr) {
//            
//            [_newsIdArray addObject:singeModel.newsId];//添加id信息
//            
//            WFSingelNewsLayout *layout = [WFSingelNewsLayout new];
//            layout.singeModel = singeModel;
//            [tempArray addObject:layout];
//        }
//        
//        [_listLayoutArr addObject:tempArray];
        finish();
        
    } failure:^(NSError *error) {
        
    }];
}

- (NSUInteger)numberOfSections
{
    return _listNews.count;
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section
{
    if (_listNews.count > section)
    {
        return [[_listNews objectAtIndex:section] count];
    }
    
    return 0;
}

- (SingleNewsModel *)singleModelForIndexPath:(NSIndexPath *)indexPath
{
    return _listNews[indexPath.section][indexPath.row];
}

- (NSString *)dateForSection:(NSInteger)section
{
    return _dateList[section];
}

- (NSMutableArray *)autoloopData
{
    return _autoLoopNews;
}

- (NSAttributedString *)headerTitleForSection:(NSInteger)section
{
    NSString *dateStr = [self convertToSectionTitleText:_dateList[section]];
    
    return [[NSAttributedString alloc] initWithString:dateStr
                                           attributes:@{
                                                        NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
                                                        NSForegroundColorAttributeName:[UIColor whiteColor]
                                                        }];
}


- (NSString *)convertToSectionTitleText:(NSString *)str
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *date = [formatter dateFromString:str];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
    [formatter setDateFormat:@"MM月dd日 EEEE"];
    
    return [formatter stringFromDate:date];
}

@end
