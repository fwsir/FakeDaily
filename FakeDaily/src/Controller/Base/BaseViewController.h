//
//  BaseViewController.h
//  FakeDaily
//
//  Created by BOOM on 16/3/21.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (strong, nonatomic) NSString *navigationTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
