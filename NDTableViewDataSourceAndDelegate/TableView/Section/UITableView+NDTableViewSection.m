//
//  UITableView+NDTableViewSection.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "UITableView+NDTableViewSection.h"

#import <objc/runtime.h>

@implementation UITableView (NDTableViewSection)

- (NSArray<NSString *> *)ndSectionObjectArray
{
    return (NSArray<NSString *> *)objc_getAssociatedObject(self, @selector(ndSectionObjectArray));
}

- (void)setNdSectionObjectArray:(NSArray<NSString *> *)ndSectionObjectArray_
{
    if (self.ndSectionObjectArray != ndSectionObjectArray_)
    {
        objc_setAssociatedObject(self, @selector(ndSectionObjectArray), ndSectionObjectArray_, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
