//
//  ThirdCell.m
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "ThirdCell.h"

#import "UITableViewCell+NDTableViewDataSource.h"
#import "Masonry.h"
#import "FirstListModel.h"

@interface ThirdCell ()

@property (nonatomic, strong) UILabel *itemLabel;

@end

@implementation ThirdCell

#pragma mark - override

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.itemLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.itemLabel];
        self.itemLabel.textAlignment = NSTextAlignmentLeft;
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
    
    self.itemLabel.text = model.digest;
}

+ (CGFloat)nd_height:(id)object viewController:(UIViewController *)viewController
{
    return 120;
}

+ (NSString *)nd_cellIdentifier:(id)object viewController:(UIViewController *)viewController
{
    return @"ThirdCellId";
}

+ (UITableViewCell *)nd_cell:(id)object resuedCell:(UITableViewCell *)resuedCell viewController:(UIViewController *)viewController
{
    if (resuedCell)
    {
        return  resuedCell;
    }
    
    resuedCell = [[ThirdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ThirdCell nd_cellIdentifier:object viewController:viewController]];
    
    return resuedCell;
}

@end
