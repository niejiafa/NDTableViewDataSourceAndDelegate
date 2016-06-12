//
//  FirstPresenter.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "FirstPresenter.h"

#import "FirstModel.h"

@implementation FirstPresenter

- (void)obtainMockData
{
    self.firstModel = [[FirstModel alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MockDataJson" ofType:@"json"];
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    self.firstModel = [FirstModel yy_modelWithJSON:jsonString];
}

@end
