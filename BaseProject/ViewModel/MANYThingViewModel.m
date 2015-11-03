//
//  MANYThingViewModel.m
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYThingViewModel.h"
#import "MANYNetManager.h"
#import "MANYTool.h"
@implementation MANYThingViewModel
//static int row = 0;
- (NSInteger)row {
    if (!_row) {
        _row = 0;
    }
    return _row;
}
- (NSMutableArray *)thingDataArr {
    if (!_thingDataArr) {
        _thingDataArr = [NSMutableArray new];
    }
    return _thingDataArr;
}
- (NSString *)getCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    return date;
}
- (MANYThingDetailModel *)getModel {
    if (_row == 0) {
        return nil;
    }else {
        return self.thingDataArr[_row-1];
    }
}
#pragma mark - 获取数据
- (NSString *)getDateLB {
    return [MANYTool getBigDateFromString:[self getModel].strTm];
}
- (NSString *)getImg {
    return [self getModel].strBu;
}
- (NSString *)getTitle {
    return [self getModel].strTt;
}
- (NSString *)getContent {
    return [self getModel].strTc;
}
#pragma mark - 网络请求
//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle {
    if (_row == 11) {
        NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:nil];
        completionHandle(error);
    }else {
        _row += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }
}
//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle {
    _row = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取数据
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    [MANYNetManager getThingWithDate:[self getCurrentDate] row:(_row) completionHandle:^(MANYThingModel *model, NSError *error) {
        if (_row == 1) {
            [self.thingDataArr removeAllObjects];
        }
        
        [self.thingDataArr addObject:model.entTg];
        completionHandle(error);
    }];
}

@end
