//
//  BaseTableViewCell.h
//  FakeDaily
//
//  Created by BOOM on 16/3/23.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SingleNewsModel;
@interface BaseTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (strong, nonatomic) SingleNewsModel *singleModel;

@end
