//
//  UITableViewCell+NDTableViewDataSource.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "UITableViewCell+NDTableViewDataSource.h"

@implementation UITableViewCell (NDTableViewDataSource)

- (void)nd_setModel:(id)object viewController:(UIViewController *)viewController
{
}

+ (NSString *)nd_cellIdentifier:(id)object viewController:(UIViewController *)viewController
{
    NSString *identifier = NSStringFromClass([object class]);
    return identifier;
}

+ (UITableViewCell *)nd_cell:(id)object resuedCell:(UITableViewCell *)resuedCell viewController:(UIViewController *)viewController
{
    if (resuedCell)
    {
        return resuedCell;
    }
    
    UITableViewCell *cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self nd_cellIdentifier:object viewController:viewController]];
    return cell;
}

+ (CGFloat)nd_height:(id)object viewController:(UIViewController *)viewController
{
    return 60;
}

- (void)nd_commitEditingStyle:(UITableViewCellEditingStyle)editingStyle object:(id)object viewController:(UIViewController *)viewController indexPath:(NSIndexPath *)indexPath
{
    
}

- (void)nd_didSelectRow:(id)object viewController:(UIViewController *)viewController
{
    
}

- (UITableViewCellEditingStyle)nd_editingStyleForRow:(id)object viewController:(UIViewController *)viewController;
{
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)nd_titleForDeleteConfirmationButtonForRow:(id)object viewController:(UIViewController *)viewController
{
    return @"删除";
}

+ (BOOL)nd_canEditRowAtIndexPath:(id)object viewController:(UIViewController *)viewController
{
    return NO;
}

+ (BOOL)nd_canMoveRowAtIndexPath:(id)object viewController:(UIViewController *)viewController
{
    return NO;
}

@end
