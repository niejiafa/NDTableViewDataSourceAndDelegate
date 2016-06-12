//
//  ViewController.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "ViewController.h"

#import "FirstDemoViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - overwrite

#pragma mark - public

#pragma mark - delegate

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = @"First";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row)
    {
        [self.navigationController pushViewController:[FirstDemoViewController new] animated:YES];
    }
}

#pragma mark - notification

#pragma mark - event response

#pragma mark - private

#pragma mark - getter and setter

@end
