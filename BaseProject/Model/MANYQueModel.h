//
//  MANYQueModel.h
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseModel.h"
@class MANYQueDetailModel,MANYQueDetailQNModel;
@interface MANYQueModel : BaseModel
/*
 questionAdEntity: {},
 result: "SUCCESS"
 */
@property (nonatomic,strong)MANYQueDetailModel *questionAdEntity;
@property (nonatomic,strong)NSString *result;
@end


@interface MANYQueDetailModel : BaseModel
/*
 entQNCmt: {},
 strLastUpdateDate: "2015-10-26 21:36:17",
 strDayDiffer: "",
 sWebLk: "http://m.wufazhuce.com/question/2015-10-26",
 strPraiseNumber: "3665",
 strQuestionId: "1147",
 strQuestionTitle: "教会老妈玩智能手机是种怎样的体验？",
 strQuestionContent: "枕边虫问：教会老妈玩智能手机是种怎样的体验？",
 strAnswerTitle: "桃啃笙答枕边虫：",
 strAnswerContent: "就在一分钟前，我妈刚刚转完三条心灵鸡汤到朋友圈。<br>其中一条还是以“是中国人你就转”开头的.
 strQuestionMarketTime: "2015-10-26",
 sEditor: "(责任编辑：好谢翔）"
 */
@property (nonatomic,strong)MANYQueDetailQNModel *entQNCmt;
@property (nonatomic,strong)NSString *strLastUpdateDate;
@property (nonatomic,strong)NSString *strDayDiffer;
@property (nonatomic,strong)NSString *sWebLk;
@property (nonatomic,strong)NSString *strPraiseNumber;
@property (nonatomic,strong)NSNumber *strQuestionId;
@property (nonatomic,strong)NSString *strQuestionTitle;
@property (nonatomic,strong)NSString *strQuestionContent;
@property (nonatomic,strong)NSString *strAnswerTitle;
@property (nonatomic,strong)NSString *strAnswerContent;
@property (nonatomic,strong)NSString *strQuestionMarketTime;
@property (nonatomic,strong)NSString *sEditor;

@end


@interface MANYQueDetailQNModel : BaseModel
/*
 strId: "",
 strD: "",
 strCnt: "",
 pNum: "",
 upFg: ""
 */
@end

