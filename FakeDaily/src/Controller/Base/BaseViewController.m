//
//  BaseViewController.m
//  FakeDaily
//
//  Created by BOOM on 16/3/21.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "BaseViewController.h"
#import "RefreshView.h"

@interface BaseViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 80;
    [self initialUI];
}

- (void)initialUI
{
    RefreshView *view = [[NSBundle mainBundle] loadNibNamed:@"RefreshView" owner:self options:nil].lastObject;
    
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(125);
        make.top.equalTo(self.view).offset(32);
        make.width.height.equalTo(@22);
    }];
}

- (void)setNavigationTitle:(NSString *)navigationTitle
{
    self.titleLabel.text = navigationTitle;
}

@end
