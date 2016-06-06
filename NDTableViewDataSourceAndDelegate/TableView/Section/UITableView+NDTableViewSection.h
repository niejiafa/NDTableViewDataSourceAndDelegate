//
//  UITableView+NDTableViewSection.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NDTableViewSectionProtocol.h"

@interface UITableView (NDTableViewSection)

@property (nonatomic, strong) NSArray<NSString *> *ndSectionObjectArray;

@end
