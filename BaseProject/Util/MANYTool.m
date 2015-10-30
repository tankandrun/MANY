//
//  MANYTool.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYTool.h"

@implementation MANYTool

+ (NSDate *)dateFromString:(NSString *)dateStr {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    [inputFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    // 标准时间
    return [inputFormatter dateFromString:dateStr];
}
+ (NSString *)getBigDateFromString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *date = [formatter stringFromDate:[self dateFromString:dateStr]];
    return date;
}
@end
