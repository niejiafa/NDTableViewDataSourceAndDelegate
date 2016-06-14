//
//  FirstListModel.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDModel.h"

@interface FirstListModel : NDModel

@property (nonatomic,copy) NSString *postid;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ltitle;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *digest;

@end
