//
//  NDTableViewSectionProtocol.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol NDTableViewSectionProtocol <NSObject>

@optional

+ (CGFloat)heightForHeader:(UITableView *)tableView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (CGFloat)heightForFooter:(UITableView *)tableView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (UIView *)viewForHeader:(UITableView *)tableView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (UIView *)viewForFooter:(UITableView *)tableView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (NSString *)titleForHeaderInSection:(UITableView *)tableView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (NSString *)titleForFooterInSection:(UITableView *)tableView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (void)willDisplayHeaderView:(UITableView *)tableView headerView:(UIView *)headerView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (void)willDisplayFooterView:(UITableView *)tableView footerView:(UIView *)footerView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (void)didEndDisplayingHeaderView:(UITableView *)tableView headerView:(UIView *)headerView section:(NSInteger)section viewController:(UIViewController *)viewController;

+ (void)didEndDisplayingFooterView:(UITableView *)tableView footerView:(UIView *)footerView section:(NSInteger)section viewController:(UIViewController *)viewController;

@end
