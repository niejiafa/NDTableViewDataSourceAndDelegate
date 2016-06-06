//
//  UITableView+DataSource.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NDTableViewDataSource;

@interface UITableView (NDDataSource)

@property (nonatomic, strong) NDTableViewDataSource *dataSourceObject;

- (void)bindDataSourceObject;

- (void)setItems:(NSArray *)items needReloadData:(BOOL)needReloadData;
- (NSArray *)items;
- (NSUInteger)itemCount;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)setIndexs:(NSArray *)indexs needReloadData:(BOOL)needReloadData;
- (NSArray *)indexs;
- (NSUInteger)indexCount;
- (id)indexItemAtIndex:(NSUInteger)index;

@end
