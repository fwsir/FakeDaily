//
//  UIView+Ex.m
//  FakeDaily
//
//  Created by BOOM on 16/3/19.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "UIView+Ex.h"

@implementation UIView (Ex)

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterX:(CGFloat)x
{
    CGPoint center = CGPointMake(x, self.center.y);
    self.center = center;
}

- (void)setCenterY:(CGFloat)y
{
    CGPoint center = CGPointMake(self.center.x, self.center.y);
    self.center = center;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end
