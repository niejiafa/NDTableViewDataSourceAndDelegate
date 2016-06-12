//
//  FirstListModel.h
//  NDTableViewDataSourceAndDelegate
//
//  Created by NDMAC on 16/6/12.
//  Copyright © 2016年 NDEducation. All rights reserved.
//

#import "NDModel.h"

@interface FirstListModel : NDModel

@property (nonatomic,copy) NSString *tname;
@property (nonatomic,copy) NSString *postid;

/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *  多图数组
 */
@property (nonatomic,strong)NSArray *imgextra;
@property (nonatomic,copy) NSString *photosetID;
@property (nonatomic,copy)NSNumber *hasHead;
@property (nonatomic,copy)NSNumber *hasImg;
@property (nonatomic,copy) NSString *lmodify;
@property (nonatomic,copy) NSString *skipType;

/**
 *  跟帖人数
 */
@property (nonatomic,copy)NSNumber *replyCount;
@property (nonatomic,copy)NSNumber *votecount;
@property (nonatomic,copy)NSNumber *voteCount;
@property (nonatomic,copy) NSString *alias;

/**
 *  新闻ID
 */
@property (nonatomic,copy) NSString *docid;
@property (nonatomic,assign)BOOL hasCover;
@property (nonatomic,copy)NSNumber *hasAD;
@property (nonatomic,copy)NSNumber *priority;
@property (nonatomic,copy) NSString *cid;
@property (nonatomic,strong)NSArray *videoID;

/**
 *  图片连接
 */
@property (nonatomic,copy) NSString *imgsrc;
@property (nonatomic,assign)BOOL hasIcon;
@property (nonatomic,copy) NSString *ename;
@property (nonatomic,copy) NSString *skipID;
@property (nonatomic,copy)NSNumber *order;

/**
 *  描述
 */
@property (nonatomic,copy) NSString *digest;
@property (nonatomic,strong)NSArray *editor;
@property (nonatomic,copy) NSString *url_3w;
@property (nonatomic,copy) NSString *specialID;
@property (nonatomic,copy) NSString *timeConsuming;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *ltitle;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *TAGS;
@property (nonatomic,copy) NSString *TAG;

/**
 *  大图样式
 */
@property (nonatomic,copy)NSNumber *imgType;
@property (nonatomic,strong)NSArray *specialextra;
@property (nonatomic,copy) NSString *boardid;
@property (nonatomic,copy) NSString *commentid;
@property (nonatomic,copy)NSNumber *speciallogo;
@property (nonatomic,copy) NSString *specialtip;
@property (nonatomic,copy) NSString *specialadlogo;
@property (nonatomic,copy) NSString *pixel;
@property (nonatomic,strong)NSArray *applist;
@property (nonatomic,copy) NSString *wap_portal;
@property (nonatomic,copy) NSString *live_info;
@property (nonatomic,copy) NSString *ads;
@property (nonatomic,copy) NSString *videosource;

@end