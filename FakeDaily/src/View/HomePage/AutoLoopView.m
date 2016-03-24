//
//  AutoLoopView.m
//  FakeDaily
//
//  Created by BOOM on 16/3/22.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "AutoLoopView.h" 
#import "AutoLoopCollectionViewCell.h"

@interface AutoLoopView () //<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

static NSString *CellReuseIdentifier = @"AutoLoopCollectionViewCell";
@implementation AutoLoopView

- (void)awakeFromNib
{
    [self.collectionView registerNib:[UINib nibWithNibName:CellReuseIdentifier bundle:nil] forCellWithReuseIdentifier:CellReuseIdentifier];
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return 5;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    AutoLoopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifier forIndexPath:indexPath];
//    
//    return cell;
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(ScreenWidth, 200);
//}

@end
