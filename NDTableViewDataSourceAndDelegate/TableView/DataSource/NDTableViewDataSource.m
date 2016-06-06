//
//  NDTableViewDataSource.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDTableViewDataSource.h"

#import "NSObject+NDTableViewCellMapKey.h"
#import "UITableView+NDTableViewSection.h"
#import "NSArray+ND.h"

@interface NDTableViewDataSource ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation NDTableViewDataSource

- (id)init
{
    NSAssert(NO, @"init discarded");
    return nil;
}

- (id)initWithItems:(NSArray *)anItems
          tableView:(UITableView *)tableView
     viewController:(UIViewController *)viewController
{
    self = [super init];
    if (self)
    {
        self.items = anItems;
        self.tableView = tableView;
        self.viewController = viewController;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [(NSArray *)[self.items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

- (id)indexItemAtIndex:(NSUInteger)index
{
    return self.indexs[index];
}

- (CGFloat)cellHeight:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    NSString *cellName = [self nd_cellName:item];
    if (!cellName || ![NSClassFromString(cellName) conformsToProtocol:NSProtocolFromString(@"NDTableViewCellProtocol")])
    {
        return 0;
    }
    
    CGFloat height = [NSClassFromString(cellName) nd_height:item viewController:self.viewController];
    return height;
}

- (UITableViewCellEditingStyle)editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (![cell respondsToSelector:@selector(nd_editingStyleForRow:viewController:)])
    {
        return UITableViewCellEditingStyleNone;
    }
    
    id item = [self itemAtIndexPath:indexPath];
    
    UITableViewCellEditingStyle style = [(id<NDTableViewCellProtocol>)cell nd_editingStyleForRow:item viewController:self.viewController];
    return style;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (![cell respondsToSelector:@selector(nd_didSelectRow:viewController:)])
    {
        return;
    }
    
    id item = [self itemAtIndexPath:indexPath];
    [(id<NDTableViewCellProtocol>)cell nd_didSelectRow:item viewController:self.viewController];
}

#pragma mark - Delegate

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger number = [self.items count];
    if (number <= 0)
    {
        number = 1;
    }
    
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)[self.items objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    
    NSString *cellName = [self nd_cellName:item];
    if (!cellName || ![NSClassFromString(cellName) conformsToProtocol:NSProtocolFromString(@"NDTableViewCellProtocol")])
    {
        BOOL useDefaultAction = YES;
        UITableViewCell *cell;
        if (self.configureCellBlock)
        {
            cell = self.configureCellBlock(nil, item, indexPath, &useDefaultAction);
        }
        return cell;
    }
    
    NSString *cellIdentifier = [NSClassFromString(cellName) nd_cellIdentifier:item viewController:self.viewController];
    UITableViewCell *reusedCell;
    if (cellIdentifier)
    {
        reusedCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    BOOL useDefaultAction = YES;
    UITableViewCell *cell;
    if (self.configureCellBlock)
    {
        cell = self.configureCellBlock(reusedCell, item, indexPath, &useDefaultAction);
    }
    if (!useDefaultAction)
    {
        return cell;
    }
    
    cell = [NSClassFromString(cellName) nd_cell:item resuedCell:reusedCell viewController:self.viewController];
    
    [(id<NDTableViewCellProtocol>)cell nd_setModel:item viewController:self.viewController];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.titleForHeaderInSection)
    {
        return self.titleForHeaderInSection(section);
    }
    
    NSString *sectionClassName = [tableView.ndSectionObjectArray nd_objectWithIndex:section];
    if ([NSClassFromString(sectionClassName) respondsToSelector:@selector(titleForHeaderInSection:section:viewController:)])
    {
        NSString *headerTitle = [NSClassFromString(sectionClassName) titleForHeaderInSection:tableView section:section viewController:self.viewController];
        return headerTitle;
    }
    
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (self.titleForFooterInSection)
    {
        return self.titleForFooterInSection(section);
    }
    
    NSString *sectionClassName = [tableView.ndSectionObjectArray nd_objectWithIndex:section];
    if ([NSClassFromString(sectionClassName) respondsToSelector:@selector(titleForFooterInSection:section:viewController:)])
    {
        NSString *footerTitle = [NSClassFromString(sectionClassName) titleForFooterInSection:tableView section:section viewController:self.viewController];
        return footerTitle;
    }
    
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.canEditRowAtIndexPath)
    {
        return self.canEditRowAtIndexPath(indexPath);
    }
    
    id item = [self itemAtIndexPath:indexPath];
    NSString *cellName = [self nd_cellName:item];
    if (!cellName || ![NSClassFromString(cellName) respondsToSelector:@selector(nd_canEditRowAtIndexPath:viewController:)])
    {
        return NO;
    }
    
    BOOL canEdit = [NSClassFromString(cellName) nd_canEditRowAtIndexPath:item viewController:self.viewController];
    return canEdit;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.edit)///有 block，执行 block
    {
        self.edit(editingStyle, indexPath);
        return;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (![cell respondsToSelector:@selector(nd_commitEditingStyle:object:viewController:indexPath:)])///没有执行 delegate方法，return
    {
        return;
    }
    
    id item = [self itemAtIndexPath:indexPath];
    
    [(id<NDTableViewCellProtocol>)cell nd_commitEditingStyle:editingStyle object:item viewController:self.viewController indexPath:indexPath];///执行代理方法
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexs;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSString *indexTitle = [self.indexs objectAtIndex:index];
    if (UITableViewIndexSearch == indexTitle)
    {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    
    return index;
}

#pragma mark - private

- (NSString *)nd_cellMapKey:(id)object
{
    NSString *key = [object ndCellMapKey];
    if (!key)
    {
        key = NSStringFromClass(object);
    }
    
    return key;
}

- (NSString *)nd_cellName:(id)object
{
    NSString *key = [self nd_cellMapKey:object];
    if (!key)
    {
        return nil;
    }
    
    NSString *cellName = self.cellMap[key];
    return cellName;
}

- (UIViewController *)viewController
{
    if (_viewController)
    {
        return _viewController;
    }
    
    _viewController = [self nd_viewController];
    return _viewController;
}

- (UIViewController *)nd_viewController
{
    for (UIView *next = [self.tableView superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
