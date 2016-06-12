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

@interface FirstDemoViewController ()

@property (nonatomic, strong) FirstPresenter *presenter;

@end

@implementation FirstDemoViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.presenter obtainMockData];
    
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

@end
