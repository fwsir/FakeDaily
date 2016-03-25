//
//  BaseTableViewCell.m
//  FakeDaily
//
//  Created by BOOM on 16/3/23.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "SingleNewsModel.h"
#import "UIImageView+Ex.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSingleModel:(SingleNewsModel *)singleModel
{
    self.cellLabel.text = singleModel.newsTitle;
    [self.cellImage setImageWithUrlString:singleModel.imagesUrl[0] placeHolder:[UIImage imageNamed:@"tags_selected"]];
}

@end
