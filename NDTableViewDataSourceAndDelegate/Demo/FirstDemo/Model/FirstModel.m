//
//  FirstModel.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "FirstModel.h"

#import "FirstListModel.h"

@implementation FirstModel

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"mockData":[FirstListModel class]};
}

@end
