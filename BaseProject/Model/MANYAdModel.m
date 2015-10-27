//
//  MANYAdModel.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYAdModel.h"

@implementation MANYAdModel

+ (NSDictionary *)objectClassInArray{
    return @{@"lstAd":[MANYAdDetailModel class]};
}
@end

@implementation MANYAdDetailModel

@end