//
//  MainViewController.m
//  FakeDaily
//
//  Created by BOOM on 16/3/19.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "MainViewController.h"
#import "LeftViewController.h"
#import "HomePageViewController.h"
#import "UIView+Ex.h"

@interface MainViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftViewWidthConstraint;
@property (assign, nonatomic) BOOL isFold;
@property (assign, nonatomic) CGPoint orignPoint;

@property (strong, nonatomic) HomePageViewController *homeVC;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.leftViewWidthConstraint.constant = LeftViewWidth;
    
    [self.leftView addSubview:self.leftVC.view];
    [self.leftVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.leftView);
    }];
    
    [self.mainView addSubview:self.homeVC.view];
    [self.homeVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainView);
    }];
}

- (HomePageViewController *)homeVC
{
    if (!_homeVC)
    {
        _homeVC = [[HomePageViewController alloc] initWithNibName:@"BaseViewController" bundle:nil];
    }
    return _homeVC;
}

- (IBAction)openLeft:(UIButton *)sender
{
    [UIView animateWithDuration:.4f animations:^{
        self.leftViewRightConstraint.constant = self.isFold ? 0 : LeftViewWidth;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.isFold = ! self.isFold;
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self.view];
        
        return fabs(translation.x) > fabs(translation.y);
    }
    
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

- (IBAction)panAction:(UIPanGestureRecognizer *)sender
{
    switch (sender.state)
    {
        case UIGestureRecognizerStateBegan:
        {
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint point = [sender translationInView:self.view];
            CGFloat constant = self.leftViewRightConstraint.constant + point.x;
            
            if (constant >= 0 && constant <= LeftViewWidth)
            {
                self.leftViewRightConstraint.constant = constant;
            }
            
            [sender setTranslation:CGPointZero inView:self.view];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            BOOL folding = self.leftViewRightConstraint.constant >= LeftViewWidth / 3.f;
            [UIView animateWithDuration:.4f animations:^{
                
                self.leftViewRightConstraint.constant = folding ? LeftViewWidth : 0;
                [self.view layoutIfNeeded];
            } completion:^(BOOL finished) {
                
                self.isFold = folding;
            }];
        }
            break;
            
        default:
            break;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
