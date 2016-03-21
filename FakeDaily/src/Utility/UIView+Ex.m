//
//  UIView+Ex.m
//  FakeDaily
//
//  Created by BOOM on 16/3/19.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "UIView+Ex.h"

@implementation UIView (Ex)

- (void)setCenterX:(CGFloat)x
{
    CGPoint center = CGPointMake(self.center.x + x, self.center.y);
    self.center = center;
}

@end
