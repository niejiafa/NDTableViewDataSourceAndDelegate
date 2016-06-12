//
//  SecondCell.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "SecondCell.h"

#import "UITableViewCell+NDTableViewDataSource.h"
#import "Masonry.h"
#import "FirstListModel.h"

@interface SecondCell ()

@property (nonatomic, strong) UILabel *itemLabel;

@end

@implementation SecondCell

#pragma mark - override

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.itemLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.itemLabel];
        self.itemLabel.textAlignment = NSTextAlignmentCenter;
        self.itemLabel.numberOfLines = 0;

        [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    
    return self;
}

- (void)nd_setModel:(id)object viewController:(UIViewController *)viewController
{
    FirstListModel *model = (FirstListModel *)object;
    
    self.itemLabel.text = model.title;
}

+ (CGFloat)nd_height:(id)object viewController:(UIViewController *)viewController
{
    return 80;
}

+ (NSString *)nd_cellIdentifier:(id)object viewController:(UIViewController *)viewController
{
    return @"SecondCellId";
}

+ (UITableViewCell *)nd_cell:(id)object resuedCell:(UITableViewCell *)resuedCell viewController:(UIViewController *)viewController
{
    if (resuedCell)
    {
        return  resuedCell;
    }
    
    resuedCell = [[SecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[SecondCell nd_cellIdentifier:object viewController:viewController]];
    
    return resuedCell;
}

@end
