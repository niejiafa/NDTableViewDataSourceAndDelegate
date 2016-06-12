//
//  FirstModel.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDModel.h"

@class FirstListModel;

@interface FirstModel : NDModel

@property (nonatomic, strong) NSMutableArray<FirstListModel *> *mockData;

@end
