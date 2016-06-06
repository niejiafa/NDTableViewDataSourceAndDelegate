//
//  UITableView+DataSource.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "UITableView+NDDataSource.h"

#import <objc/runtime.h>

#import "NDTableViewDataSource.h"

@implementation UITableView (DataSource)

- (NDTableViewDataSource *)dataSourceObject
{
    return (NDTableViewDataSource *)objc_getAssociatedObject(self, @selector(dataSourceObject));
}

- (void)setDataSourceObject:(NDTableViewDataSource *)dataSourceObject_
{
    if (self.dataSourceObject != dataSourceObject_)
    {
        objc_setAssociatedObject(self, @selector(dataSourceObject), dataSourceObject_, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)bindDataSourceObject
{
    self.dataSource = self.dataSourceObject;
}

- (void)setItems:(NSArray *)items_ needReloadData:(BOOL)needReloadData_
{
    self.dataSourceObject.items = items_;
    if (needReloadData_)
    {
        [self reloadData];
    }
}

- (NSArray *)items
{
    return self.dataSourceObject.items;
}

- (NSUInteger)itemCount
{
    return [[self items] count];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSourceObject itemAtIndexPath:indexPath];
}

- (void)setIndexs:(NSArray *)indexs_ needReloadData:(BOOL)needReloadData_
{
    self.dataSourceObject.indexs = indexs_;
    if (needReloadData_)
    {
        [self reloadData];
    }
}

- (NSArray *)indexs
{
    return self.dataSourceObject.indexs;
}

- (NSUInteger)indexCount
{
    return [[self indexs] count];
}

- (id)indexItemAtIndex:(NSUInteger)index
{
    return [self.dataSourceObject indexItemAtIndex:index];
}

@end
