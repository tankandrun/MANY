//
//  MANYAdModel.h
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"

@interface MANYAdModel : BaseModel
/*
 lstAd: [],
 result: "SUCCESS"
 */
@property (nonatomic,strong)NSArray *lstAd;
@property (nonatomic,strong)NSString *result;
@end


@interface MANYAdDetailModel : BaseModel
/*
 strAdId: "1082",
 strAd800480url: "http://pic.yupoo.com/hanapp/F35dYLPc/V7szS.jpg",
 strPv: "http://bea.wufazhuce.com/OneForWeb/oneads/o_v?sP0=1082",
 strAdSC: "",
 strAdOrder: "1",
 strType: "0",
 strAd1280720url: "http://pic.yupoo.com/hanapp/F35dZnKS/VG4hL.jpg",
 strAd960540url: "http://pic.yupoo.com/hanapp/F35dYDHZ/hzKgi.jpg",
 strAd480320url: "http://pic.yupoo.com/hanapp/F35dZxZ3/Wt7mr.jpg",
 strAdFutureurl: "http://pic.yupoo.com/hanapp/F35dZxZ3/Wt7mr.jpg",
 strAdLinkUrl: "https://ad.doubleclick.net/ddm/trackclk/N6708.1987905O
 */
@property (nonatomic,strong)NSNumber *strAdId;
@property (nonatomic,strong)NSString *strAd800480url;
@property (nonatomic,strong)NSString *strPv;
@property (nonatomic,strong)NSString *strAdSC;
@property (nonatomic,strong)NSNumber *strAdOrder;
@property (nonatomic,strong)NSNumber *strType;
@property (nonatomic,strong)NSString *strAd1280720url;
@property (nonatomic,strong)NSString *strAd960540url;
@property (nonatomic,strong)NSString *strAd480320url;
@property (nonatomic,strong)NSString *strAdFutureurl;
@property (nonatomic,strong)NSString *strAdLinkUrl;

@end
