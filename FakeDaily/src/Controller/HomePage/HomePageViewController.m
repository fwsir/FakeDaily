//
//  HomePageViewController.m
//  FakeDaily
//
//  Created by BOOM on 16/3/22.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "HomePageViewController.h"
#import "AutoLoopCollectionViewCell.h"
#import "BaseTableViewHeaderView.h"
#import "BaseTableViewCell.h"
#import "AutoLoopView.h"


@interface HomePageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) AutoLoopView *loopView;
@property (strong, nonatomic) dispatch_source_t timer;

@end

static NSString *BaseCellIdentifier = @"BaseTableViewCell";
static NSString *LoopCellIdentifier = @"AutoLoopCollectionViewCell";
static NSString *BaseHeaderIdentifier = @"BaseTableViewHeader";

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerNib:[UINib nibWithNibName:BaseCellIdentifier bundle:nil] forCellReuseIdentifier:BaseCellIdentifier];
    [self.tableView registerClass:[BaseTableViewHeaderView class] forHeaderFooterViewReuseIdentifier:BaseCellIdentifier];
    
    [self startTimer];
}

- (void)setupUI
{
    self.loopView = [[NSBundle mainBundle] loadNibNamed:@"AutoLoopView" owner:self options:nil].lastObject;
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, ScreenWidth, 200);
    view.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:self.loopView];
    [self.loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
    
    view.backgroundColor = [UIColor greenColor];
    self.tableView.tableHeaderView = view;
}

- (void)startTimer
{
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(self.timer, start, 4 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self autoLoopAction];
        });
    });
    
    dispatch_resume(self.timer);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5 * 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AutoLoopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LoopCellIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", (int)(indexPath.item % 5 + 3)]];
    cell.cellLabel.text = @"你好吗";
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth, 200);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaseCellIdentifier forIndexPath:indexPath];
    
    cell.cellLabel.text = [NSString stringWithFormat:@"This is Cell %d", (int)indexPath.item];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    
    BaseTableViewHeaderView *view = [[BaseTableViewHeaderView alloc] init];
    view.contentView.backgroundColor = RGB(5, 143, 214);
    view.textLabel.text = @"This is textLabel..";
    
    return view;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]])
    {
        CGFloat offsetX = scrollView.contentOffset.x;
        
        if (offsetX > ScreenWidth * 9)
        {
            [self.loopView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
        else if (offsetX < 0)
        {
            [self.loopView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:9 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]])
    {
        CGFloat offsetX = scrollView.contentOffset.x;
        
        if (offsetX > ScreenWidth * 9)
        {
            [self.loopView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        }
    }
}

- (void)autoLoopAction
{
    NSIndexPath *indexPath = [self.loopView.collectionView indexPathsForVisibleItems].lastObject;
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:(indexPath.item+1) % 10 inSection:0];
    BOOL animated = indexPath.item == 9 ? NO : YES;
    
    [self.loopView.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:animated];
}

@end
