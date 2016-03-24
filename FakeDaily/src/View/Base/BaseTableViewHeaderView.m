//
//  BaseTableViewHeaderView.m
//  FakeDaily
//
//  Created by BOOM on 16/3/23.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "BaseTableViewHeaderView.h"
#import "UIView+Ex.h"

@implementation BaseTableViewHeaderView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.centerX = self.width / 2;
}

@end
