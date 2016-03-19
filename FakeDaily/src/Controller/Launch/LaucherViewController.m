//
//  LaucherViewController.m
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "LaucherViewController.h"
#import "CoreManager+MainInfo.h"
#import "UIImageView+Ex.h"

@interface LaucherViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *firstLaunchView;
@property (weak, nonatomic) IBOutlet UIImageView *secondLaunchView;

@end

@implementation LaucherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self showLaunchAnimation];
}

- (void)showLaunchAnimation
{
    WS(weakSelf)
    [CoreManager getLaunchImageWithSize:@"720*1184" success:^(id json) {
        
        [weakSelf.secondLaunchView setImageWithUrlString:json[@"img"] placeHolder:nil];
        [UIView animateWithDuration:2 animations:^{
            weakSelf.firstLaunchView.alpha = 0;
            weakSelf.secondLaunchView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [weakSelf.firstLaunchView removeFromSuperview];
            
            [UIView animateWithDuration:0.4 animations:^{
                weakSelf.secondLaunchView.alpha = 0;
            } completion:^(BOOL finished) {
                [weakSelf.secondLaunchView removeFromSuperview];
            }];
        }];
        
    } failure:^(NSError *error) {
        [weakSelf.firstLaunchView removeFromSuperview];
        [weakSelf.secondLaunchView removeFromSuperview];
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
