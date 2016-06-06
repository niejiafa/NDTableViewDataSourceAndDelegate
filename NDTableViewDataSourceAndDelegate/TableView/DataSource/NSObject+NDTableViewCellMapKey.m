//
//  NSObject+NDTableViewCellMapKey.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NSObject+NDTableViewCellMapKey.h"

#import <objc/runtime.h>

@implementation NSObject (NDTableViewCellMapKey)

- (NSString *)ndCellMapKey
{
    return (NSString *)objc_getAssociatedObject(self, @selector(ndCellMapKey));
}

- (void)setNdCellMapKey:(NSString *)ndCellMapKey_
{
    if (![self.ndCellMapKey isEqualToString:ndCellMapKey_])
    {
        objc_setAssociatedObject(self, @selector(ndCellMapKey), ndCellMapKey_, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (id)ndCellOtherInfo
{
    return (id)objc_getAssociatedObject(self, @selector(ndCellOtherInfo));
}

- (void)setNdCellOtherInfo:(id)ndCellOtherInfo_
{
    if (self.ndCellOtherInfo != ndCellOtherInfo_)
    {
        objc_setAssociatedObject(self, @selector(ndCellOtherInfo), ndCellOtherInfo_, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
