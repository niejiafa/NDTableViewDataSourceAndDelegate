//
//  NDTableViewDataSource.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NDTableViewCellProtocol.h"

// you will judge if cell is nil, if yes, you will create a new one and return it. if no, return cell directly.
typedef UITableViewCell* (^TableViewCellConfigureBlock)(id reusedCell, id item, NSIndexPath *indexPath, BOOL *useDefaultAction);

@interface NDTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSArray *indexs;

@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *cellMap;

// optional
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock; // default return nil.
@property (nonatomic, copy) NSString* (^titleForHeaderInSection)(NSInteger section); // default return nil.
@property (nonatomic, copy) NSString* (^titleForFooterInSection)(NSInteger section); // default return nil.
@property (nonatomic, copy) BOOL (^canEditRowAtIndexPath)(NSIndexPath *indexPath); // default return YES.
@property (nonatomic, copy) void (^edit)(UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath); // default nothing.

// if using xib to create cell or create by yourself, set cellClass nil. cellIdentifier and tableView can be nil.
- (id)initWithItems:(NSArray *)anItems
          tableView:(UITableView *)tableView
     viewController:(UIViewController *)viewController;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (id)indexItemAtIndex:(NSUInteger)index;

- (CGFloat)cellHeight:(NSIndexPath *)indexPath;

///API for delegate to used
- (UITableViewCellEditingStyle)editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;

@end
