//
//  MANYThingModel.h
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"
@class MANYThingDetailModel;
@interface MANYThingModel : BaseModel
/*
 entTg: {},
 rs: "SUCCESS"
 */
@property (nonatomic,strong)MANYThingDetailModel *entTg;
@property (nonatomic,strong)NSString *rs;
@end

@interface MANYThingDetailModel : BaseModel
/*
 strLastUpdateDate: "2015-10-24 10:18:04",
 strPn: "0",
 strBu: "http://pic.yupoo.com/hanapp/F29lTqyE/7LA4a.jpg",
 strTm: "2015-10-24",
 strWu: "http://mp.weixin.qq.com/s?__biz=MjM5ODA0NTc4MA==&mid=400449159&idx=1&sn=b80372d1332a4fafd7c63fb99f906efd&scene=0#rd",
 strId: "655",
 strTt: "ONE三周年群星作者祝福短片",
 strTc: "一个有你 三生有幸"
 */
@property (nonatomic,strong)NSString *strLastUpdateDate;
@property (nonatomic,strong)NSNumber *strPn;
@property (nonatomic,strong)NSString *strBu;
@property (nonatomic,strong)NSString *strTm;
@property (nonatomic,strong)NSString *strWu;
@property (nonatomic,strong)NSNumber *strId;
@property (nonatomic,strong)NSString *strTt;
@property (nonatomic,strong)NSString *strTc;

@end