//
//  MANYTool.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYTool.h"
#import "BaseViewModel.h"
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

+ (void)getInterFaceWithTableView:(UITableView *)tableview usingViewModel:(id)viewModel atSuperView:(UIView *)superView {
    UIImageView *cover = [[UIImageView alloc]init];
    cover.backgroundColor = [UIColor whiteColor];
    cover.frame = superView.frame;
    [superView addSubview:cover];
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewModel refreshDataCompletionHandle:^(NSError *error) {
                [cover removeFromSuperview];
                [tableview reloadData];
                [SVProgressHUD dismiss];
            }];
        });
    });
}
+(UIView *)addTopLogo {
    UIImageView *topLogo = [[UIImageView alloc]init];
    topLogo.contentMode = UIViewContentModeScaleAspectFit;
    topLogo.image = [UIImage imageNamed:@"navLogo"];
    topLogo.frame = CGRectMake(0, 0, 100, 18);
    return topLogo;
}

+(UIBarButtonItem *)addButton{
    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [shareButton setImage:[UIImage imageNamed:@"shareBtn"] forState:(UIControlStateNormal)];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithCustomView:shareButton];
    return shareItem;
}
@end
