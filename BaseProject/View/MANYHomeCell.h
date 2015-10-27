//
//  MANYHomeCell.h
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MANYHomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *strHpTitle;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *zuoZhe;
@property (weak, nonatomic) IBOutlet UILabel *zuoPin;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *monthYear;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIButton *strPn;

@end
