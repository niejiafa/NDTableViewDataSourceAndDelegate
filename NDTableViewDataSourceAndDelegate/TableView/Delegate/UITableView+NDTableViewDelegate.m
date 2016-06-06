//
//  UITableView+NDTableViewDelegate.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/6.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "UITableView+NDTableViewDelegate.h"

#import <objc/runtime.h>

@implementation UITableView (NDTableViewDelegate)

- (NDTableViewDelegate *)ndDelegate
{
    return (NDTableViewDelegate *)objc_getAssociatedObject(self, @selector(ndDelegate));
}

- (void)setNdDelegate:(NDTableViewDelegate *)ndDelegate_
{
    if (self.ndDelegate != ndDelegate_)
    {
        objc_setAssociatedObject(self, @selector(ndDelegate), ndDelegate_, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        self.delegate = (id<UITableViewDelegate>)self.ndDelegate;
    }
}

@end
