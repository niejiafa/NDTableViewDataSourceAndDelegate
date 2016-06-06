//
//  NSObject+NDTableViewCellMapKey.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NDTableViewCellMapKey)

@property (nonatomic, strong) NSString *ndCellMapKey;
@property (nonatomic, strong) id ndCellOtherInfo;

@end
