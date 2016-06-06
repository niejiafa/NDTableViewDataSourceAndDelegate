//
//  NDTableViewDelegate.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NDTableViewDelegate : NSObject <UITableViewDelegate>

- (id)initWithDelegate:(id<UITableViewDelegate>)delegate
             tableView:(UITableView *)tableView
        viewController:(UIViewController *)viewController;

@end
