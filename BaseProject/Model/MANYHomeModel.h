//
//  MANYHomeModel.h
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"
@class MANYHomeHpEntityModel;
@interface MANYHomeModel : BaseModel
/*
 hpEntity: {},
 result: "SUCCESS"
 */
@property (nonatomic,strong)MANYHomeHpEntityModel *hpEntity;
@property (nonatomic,strong)NSString *result;

@end


@interface MANYHomeHpEntityModel : BaseModel
/*
 strLastUpdateDate: "2015-10-24 15:58:36",
 strDayDiffer: "",
 strHpId: "1141",
 strHpTitle: "VOL.1113",
 strThumbnailUrl: "http://pic.yupoo.com/hanapp/F3bIWJzN/1Z7sC.jpg",
 strOriginalImgUrl: "http://pic.yupoo.com/hanapp/F3bIWJzN/1Z7sC.jpg",
 strAuthor: "张望&于Rum 作品",
 strContent: "人类的一个大麻烦，在于我们无法拥有说一不二的感情，敌人身上总有让我们喜欢的地方，我们的爱人身上总会有让我们讨厌之处。by 叶芝",
 strMarketTime: "2015-10-25",
 sWebLk: "http://m.wufazhuce.com/one/2015-10-25",
 strPn: "29336",
 wImgUrl: "http://211.152.49.184:9000/upload/onephoto/f1445673516232.jpg"
 */
@property (nonatomic,strong)NSString *strLastUpdateDatep;
@property (nonatomic,strong)NSString *strDayDiffer;
@property (nonatomic,strong)NSNumber *strHpId;
@property (nonatomic,strong)NSString *strHpTitle;
@property (nonatomic,strong)NSString *strThumbnailUrl;
@property (nonatomic,strong)NSString *strOriginalImgUrl;
@property (nonatomic,strong)NSString *strAuthor;
@property (nonatomic,strong)NSString *strContent;
@property (nonatomic,strong)NSString *strMarketTime;
@property (nonatomic,strong)NSNumber *strPn;
@property (nonatomic,strong)NSString *sWebLk;
@property (nonatomic,strong)NSString *wImgUrl;

@end