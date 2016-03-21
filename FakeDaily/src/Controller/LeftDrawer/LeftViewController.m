//
//  LeftViewController.m
//  FakeDaily
//
//  Created by BOOM on 16/3/21.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftTableViewCell.h"
#import "LeftDataModel.h"

@interface LeftViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) LeftDataModel *leftModel;

@end


static NSString *LeftCell = @"LeftTableViewCell";
@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:LeftCell bundle:nil] forCellReuseIdentifier:LeftCell];
}

- (LeftDataModel *)leftModel
{
    if (!_leftModel)
    {
        _leftModel = [[LeftDataModel alloc] init];
    }
    return _leftModel;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leftModel.leftList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftCell forIndexPath:indexPath];
    cell.cellTitle.text = self.leftModel.leftList[indexPath.row];
    
    return cell;
}

@end
