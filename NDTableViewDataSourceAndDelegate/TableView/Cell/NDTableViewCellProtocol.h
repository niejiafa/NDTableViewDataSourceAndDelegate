//
//  NDTableViewCellProtocol.h
//  PANewToapAPP
//
//  Created by ND on 5/13/16.
//  Copyright © 2016 PingAn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol NDTableViewCellProtocol <NSObject>

+ (NSString *)nd_cellIdentifier:(id)object viewController:(UIViewController *)viewController;

+ (UITableViewCell *)nd_cell:(id)object resuedCell:(UITableViewCell *)resuedCell viewController:(UIViewController *)viewController;

+ (CGFloat)nd_height:(id)object viewController:(UIViewController *)viewController;

- (void)nd_setModel:(id)object viewController:(UIViewController *)viewController;

@optional

- (void)nd_commitEditingStyle:(UITableViewCellEditingStyle)editingStyle object:(id)object viewController:(UIViewController *)viewController indexPath:(NSIndexPath *)indexPath;

- (void)nd_didSelectRow:(id)object viewController:(UIViewController *)viewController;

- (UITableViewCellEditingStyle)nd_editingStyleForRow:(id)object viewController:(UIViewController *)viewController;
- (NSString *)nd_titleForDeleteConfirmationButtonForRow:(id)object viewController:(UIViewController *)viewController;
+ (BOOL)nd_canEditRowAtIndexPath:(id)object viewController:(UIViewController *)viewController;
+ (BOOL)nd_canMoveRowAtIndexPath:(id)object viewController:(UIViewController *)viewController;

@end
