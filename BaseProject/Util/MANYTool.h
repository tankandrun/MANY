//
//  MANYTool.h
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MANYTool : NSObject
/**
 *  将日期的字符串转换为NSDate类型
 */
+ (NSDate *)dateFromString:(NSString *)dateStr;
/**
 *  获取MMMM dd, yyyy型的日期
 */
+ (NSString *)getBigDateFromString:(NSString *)dateStr;
/**
 *  显示界面
 */
+ (void)getInterFaceWithTableView:(UITableView *)tableview usingViewModel:(id)viewModel atSuperView:(UIView *)superView;
/**
 *  添加TopLogo
 */
+(UIView *)addTopLogo;
/**
 *  添加右上角Button并添加弹出分享菜单功能
 */
+(UIBarButtonItem *)addButtonAndTarget:(id)target;

@end
