//
//  NDTableViewDelegate.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDTableViewDelegate.h"

#import "UITableView+NDDataSource.h"
#import "UITableViewCell+NDTableViewDataSource.h"
#import "NDTableViewDataSource.h"
#import "UITableView+NDTableViewSection.h"
#import "NSArray+ND.h"

@interface NDTableViewDelegate ()

@property (nonatomic, weak) id<UITableViewDelegate> delegate;

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation NDTableViewDelegate

#pragma mark - life cycle

- (id)initWithDelegate:(id<UITableViewDelegate>)delegate
             tableView:(UITableView *)tableView
        viewController:(UIViewController *)viewController
{
    self = [super init];
    if (self)
    {
        self.tableView = tableView;
        self.viewController = viewController;
        self.delegate = delegate;
    }
    
    return self;
}

- (id)init
{
    NSAssert(NO, @"init discarded");
    return nil;
}

#pragma mark - UITableViewDelegate

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
    {
        CGFloat height = [self.delegate tableView:tableView heightForRowAtIndexPath:indexPath];
        return height;
    }
    
    CGFloat height = [tableView.dataSourceObject cellHeight:indexPath];
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)])
    {
        CGFloat height = [self.delegate tableView:tableView heightForHeaderInSection:section];
        return height;
    }
    
    NSString *sectionClassName = [tableView.ndSectionObjectArray nd_objectWithIndex:section];
    if ([NSClassFromString(sectionClassName) respondsToSelector:@selector(heightForHeader:section:viewController:)])
    {
        CGFloat headerHeight = [NSClassFromString(sectionClassName) heightForHeader:tableView section:section viewController:self.viewController];
        return headerHeight;
    }
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:heightForFooterInSection:)])
    {
        CGFloat height = [self.delegate tableView:tableView heightForFooterInSection:section];
        return height;
    }
    
    NSString *sectionClassName = [tableView.ndSectionObjectArray nd_objectWithIndex:section];
    if ([NSClassFromString(sectionClassName) respondsToSelector:@selector(heightForFooter:section:viewController:)])
    {
        CGFloat footerHeight = [NSClassFromString(sectionClassName) heightForFooter:tableView section:section viewController:self.viewController];
        return footerHeight;
    }
    
    return 0.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
    {
        UIView *view = [self.delegate tableView:tableView viewForHeaderInSection:section];
        return view;
    }
    
    NSString *sectionClassName = [tableView.ndSectionObjectArray nd_objectWithIndex:section];
    if ([NSClassFromString(sectionClassName) respondsToSelector:@selector(viewForHeader:section:viewController:)])
    {
        UIView *view = [NSClassFromString(sectionClassName) viewForHeader:tableView section:section viewController:self.viewController];
        return view;
    }
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)])
    {
        UIView *view = [self.delegate tableView:tableView viewForFooterInSection:section];
        return view;
    }
    
    NSString *sectionClassName = [tableView.ndSectionObjectArray nd_objectWithIndex:section];
    if ([NSClassFromString(sectionClassName) respondsToSelector:@selector(viewForFooter:section:viewController:)])
    {
        UIView *view = [NSClassFromString(sectionClassName) viewForFooter:tableView section:section viewController:self.viewController];
        return view;
    }
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
        return;
    }
    
    [tableView.dataSourceObject didSelectRowAtIndexPath:indexPath tableView:tableView];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)])
    {
        UITableViewCellEditingStyle cellEditingStyle = [self.delegate tableView:tableView editingStyleForRowAtIndexPath:indexPath];
        return cellEditingStyle;
    }
    
    return [tableView.dataSourceObject editingStyleForRowAtIndexPath:indexPath tableView:tableView];
}

@end
