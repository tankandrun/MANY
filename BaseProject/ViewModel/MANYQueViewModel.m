//
//  MANYQueViewModel.m
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYQueViewModel.h"
#import "MANYNetManager.h"
#import "MANYTool.h"
@implementation MANYQueViewModel
//static int row = 0;
- (NSInteger)row {
    if (!_row) {
        _row = 0;
    }
    return _row;
}
- (NSMutableArray *)queDataArr {
    if (!_queDataArr) {
        _queDataArr = [NSMutableArray new];
    }
    return _queDataArr;
}
- (NSString *)getCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    return date;
}
- (MANYQueDetailModel *)getModel {
    if (_row == 0) {
        return nil;
    }else {
        return self.queDataArr[_row-1];
    }
}
#pragma mark - 获取数据
- (NSString *)getStrContMarketTime {
    return [MANYTool getBigDateFromString:[self getModel].strQuestionMarketTime];
}
- (NSString *)getQueTitle {
    return [self getModel].strQuestionTitle;
}
- (NSString *)getQueContent {
    return [self getModel].strQuestionContent;
}
- (NSString *)getAnsTitle {
    return [self getModel].strAnswerTitle;
}
- (NSString *)getAnsContent {
    return [self getModel].strAnswerContent;
}
- (NSString *)getSEditor {
    return [self getModel].sEditor;
}
- (NSString *)getPn {
    return [self getModel].strPraiseNumber;
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
    [MANYNetManager getQueWithDate:[self getCurrentDate] row:_row completionHandle:^(MANYQueModel *model, NSError *error) {
        if (_row == 1) {
            [self.queDataArr removeAllObjects];
        }
        
        [self.queDataArr addObject:model.questionAdEntity];
        completionHandle(error);
    }];

}

@end
