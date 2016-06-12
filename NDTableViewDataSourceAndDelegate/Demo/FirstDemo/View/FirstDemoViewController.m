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

#pragma mark - overwrite

#pragma mark - public

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

#pragma mark - private

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
    dataSource.cellMap = self.presenter.cellMap;
    _tableView.dataSourceObject = dataSource;
    [_tableView bindDataSourceObject];
    
    return _tableView;
}

@end
