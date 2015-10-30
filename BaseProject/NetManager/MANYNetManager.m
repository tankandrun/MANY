//
//  MANYNetManager.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYNetManager.h"

@implementation MANYNetManager
/*
 1.首页
 http://rest.wufazhuce.com/OneForWeb/one/getHp_N?strDate=2015-10-25&strRow=1
 //需要更改strDate（当前日期），strRow（最大为10，初始为0，每加一显示前一天的数据）
 2.文章
 http://rest.wufazhuce.com/OneForWeb/one/getC_N?strDate=2015-10-25&strRow=1&strMS=1
 //需要更改strDate（当前日期），strRow（最大为10，初始为0，每加一显示前一天的数据）
 3.问题
 http://rest.wufazhuce.com/OneForWeb/one/getQ_N?strDate=2015-10-25&strUi=&strRow=1
 //需要更改strDate（当前日期），strRow（最大为10，初始为0，每加一显示前一天的数据）
 4.东西
 http://rest.wufazhuce.com/OneForWeb/one/o_f?strDate=2015-10-25&strRow=2
 //需要更改strDate（当前日期），strRow（最大为10，初始为0，每加一显示前一天的数据）
 */
+ (id)getHomeWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYHomeModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/getHp_N?strDate=%@&strRow=%@",date,@(row)];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYHomeModel objectWithKeyValues:responseObj],error);
    }];
}
+ (id)getReadingWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYReadingModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/getC_N?strDate=%@&strRow=%@&strMS=1",date,@(row)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYReadingModel objectWithKeyValues:responseObj],error);
    }];
}
+ (id)getQueWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYQueModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/getQ_N?strDate=%@&strUi=&strRow=%@",date,@(row)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYQueModel objectWithKeyValues:responseObj],error);
    }];
}
+ (id)getThingWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYThingModel *model,NSError *error))completionHandle {
    NSString *path = [NSString stringWithFormat:@"http://rest.wufazhuce.com/OneForWeb/one/o_f?strDate=%@&strRow=%@",date,@(row)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MANYThingModel objectWithKeyValues:responseObj],error);
    }];
}
@end
