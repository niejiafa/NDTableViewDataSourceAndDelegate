//
//  FirstDemoViewController.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "FirstDemoViewController.h"

#import "FirstModel.h"
#import "FirstPresenter.h"
#import "Masonry.h"
#import "NDTableViewDelegate.h"
#import "NDTableViewDataSource.h"
#import "UITableView+NDTableViewDelegate.h"
#import "UITableView+NDDataSource.h"

@interface FirstDemoViewController ()

@property (nonatomic, strong) FirstPresenter *presenter;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FirstDemoViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.presenter obtainMockData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - getter and setter

- (FirstPresenter *)presenter
{
    if (_presenter)
    {
        return _presenter;
    }
    
    _presenter = [[FirstPresenter alloc] init];
    
    return _presenter;
}

- (UITableView *)tableView
{
    if (_tableView)
    {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    _tableView.ndDelegate = [[NDTableViewDelegate alloc] initWithDelegate:(id<UITableViewDelegate>)self tableView:_tableView viewController:self];
    
    NDTableViewDataSource *dataSource = [[NDTableViewDataSource alloc]initWithItems:self.presenter.dataArray tableView:_tableView viewController:self];
    dataSource.cellMap = self.presenter.cellMap;///将不同 Cell 映射到字典中，便于后期在dataSourceObject中通过[self nd_cellName:item]此方法获取到类名
    _tableView.dataSourceObject = dataSource;///dataSource 动态绑定到 tableView的dataSourceObject
    [_tableView bindDataSourceObject];///dataSource作为 tableView的 dataSource,实现 UITableViewDataSource的协议方法
    
    return _tableView;
}

@end
