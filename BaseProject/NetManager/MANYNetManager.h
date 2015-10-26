//
//  MANYNetManager.h
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseNetManager.h"
#import "MANYHomeModel.h"
#import "MANYReadingModel.h"
#import "MANYQueModel.h"
#import "MANYThingModel.h"


@interface MANYNetManager : BaseNetManager
+ (id)getHomeWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYHomeModel *model,NSError *error))completionHandle;
+ (id)getReadingWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYReadingModel *model,NSError *error))completionHandle;
+ (id)getQueWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYQueModel *model,NSError *error))completionHandle;
+ (id)getThingWithDate:(NSString *)date row:(NSInteger)row completionHandle:(void(^)(MANYThingModel *model,NSError *error))completionHandle;
@end
