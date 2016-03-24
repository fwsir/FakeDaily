//
//  RefreshView.m
//  FakeDaily
//
//  Created by BOOM on 16/3/21.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "RefreshView.h"
#import "UIView+Ex.h"

@interface RefreshView ()

@property (nonatomic, assign) CGFloat ratio;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation RefreshView

- (void)drawRect:(CGRect)rect
{
    if (self.ratio == 0)
    {
        return;
    }
    
    CGFloat radius = (self.width - 5) / 2;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat endAngle = 2 * M_PI * self.ratio;
    
    CGContextAddArc(context, self.width / 2, self.width / 2, radius, 0, endAngle, 0);
    [[UIColor whiteColor] setStroke];
    CGContextStrokePath(context);
}

- (void)circleWithRatio:(CGFloat)ratio
{
    if (ratio > 1)
    {
        return;
    }
    
    self.ratio = ratio;
    [self setNeedsDisplay];// 调用drawRect
}

- (void)startAniamtion
{
    [self.indicatorView startAnimating];
}

- (void)stopAniamtion
{
    [self.indicatorView stopAnimating];
}

@end
