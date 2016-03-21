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
    [CoreManager getLaunchImageWithSize:@"720*1184" success:^(id json) {
        
        [self.secondLaunchView setImageWithUrlString:json[@"img"] placeHolder:nil];
        [UIView animateWithDuration:2 animations:^{
            self.firstLaunchView.alpha = 0;
            self.secondLaunchView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [self.firstLaunchView removeFromSuperview];
            
            [UIView animateWithDuration:0.4 animations:^{
                self.secondLaunchView.alpha = 0;
            } completion:^(BOOL finished) {
                
                [self.secondLaunchView removeFromSuperview];
                [self.view removeFromSuperview];
            }];
        }];
        
    } failure:^(NSError *error) {
        [self.firstLaunchView removeFromSuperview];
        [self.secondLaunchView removeFromSuperview];
        
        [self.view removeFromSuperview];
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
