//
//  MANYReadingModel.h
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"
@class MANYReadingContentModel;
@interface MANYReadingModel : BaseModel
/*
 contentEntity: {},
 result: "SUCCESS"
 */
@property (nonatomic,strong)MANYReadingContentModel *contentEntity;
@property (nonatomic,strong)NSString *result;
@end


@interface MANYReadingContentModel : BaseModel
/*
 strLastUpdateDate: "2015-10-22 15:35:36",
 strContent: "1.<br>一觉醒来，我又站在了这里，和五年前一模一样。
 sWebLk: "http://m.wufazhuce.com/article/2015-10-26",
 wImgUrl: "http://211.152.49.184:9000/upload/onephoto/f1445499122072.jpg",
 sRdNum: "110212",
 strPraiseNumber: "6632",
 strContDayDiffer: "",
 strContentId: "1198",
 strContTitle: "时空复仇计划",
 strContAuthor: "方慧",
 strContAuthorIntroduce: "（责任编辑：金子棋）",
 strContMarketTime: "2015-10-26",
 sGW: "“你不是想问我这是不是最后一次跑步吗，我告诉你，不是！我们以后会跑几百次，几千次，我们还会结婚，搬进大房子，每天幸福地生活在一起。”",
 sAuth: "方慧，90后作者、编剧，已在「一个」发表《S小姐的朋友圈》、《手机里的男朋友》、《微博自杀记》等文。著有新书《手机里的男朋友》。",
 sWbN: "@方慧",
 subTitle: ""
 */
@property (nonatomic,strong)NSString *strLastUpdateDate;
@property (nonatomic,strong)NSString *strContent;
@property (nonatomic,strong)NSString *sWebLk;
@property (nonatomic,strong)NSString *wImgUrl;
@property (nonatomic,strong)NSNumber *sRdNum;
@property (nonatomic,strong)NSString *strPraiseNumber;
@property (nonatomic,strong)NSString *strContDayDiffer;
@property (nonatomic,strong)NSNumber *strContentId;
@property (nonatomic,strong)NSString *strContTitle;
@property (nonatomic,strong)NSString *strContAuthor;
@property (nonatomic,strong)NSString *strContAuthorIntroduce;
@property (nonatomic,strong)NSString *strContMarketTime;
@property (nonatomic,strong)NSString *sGW;
@property (nonatomic,strong)NSString *sAuth;
@property (nonatomic,strong)NSString *sWbN;
@property (nonatomic,strong)NSString *subTitle;

@end
