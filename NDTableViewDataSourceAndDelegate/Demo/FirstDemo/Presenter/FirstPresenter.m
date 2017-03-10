//
//  FirstPresenter.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "FirstPresenter.h"

#import "FirstModel.h"
#import "FirstListModel.h"
#import "NSMutableArray+ND.h"
#import "NSObject+NDTableViewCellMapKey.h"

@implementation FirstPresenter

#pragma mark - public

- (void)obtainMockData
{    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MockDataJson" ofType:@"json"];
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    FirstModel *model = [FirstModel yy_modelWithJSON:jsonString];
    
    self.dataArray = [NSMutableArray array];
    [model.mockData enumerateObjectsUsingBlock:^(FirstListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.postid isEqualToString:@"FirstID"])
        {
            obj.ndCellMapKey = @"FirstCellTypeMapKey";
        }
        else if ([obj.postid isEqualToString:@"SecondID"])
        {
            obj.ndCellMapKey = @"SecondCellTypeMapKey";
        }
        else if ([obj.postid isEqualToString:@"ThirdID"])
        {
            obj.ndCellMapKey = @"ThirdCellTypeMapKey";
        }
        
        [self.dataArray nd_addObj:[NSMutableArray arrayWithObject:obj]];
    }];
}

#pragma mark - getter and setter

- (NSDictionary *)cellMap
{
    if (_cellMap)
    {
        return _cellMap;
    }
    
    _cellMap = @{@"FirstCellTypeMapKey":@"FirstCell",
                 @"SecondCellTypeMapKey":@"SecondCell",
                 @"ThirdCellTypeMapKey":@"ThirdCell"};
    
    return _cellMap;
}

@end
