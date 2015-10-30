//
//  MANYQueCell.h
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MANYQueCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLB;
@property (weak, nonatomic) IBOutlet UILabel *questionTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *questionContent;
@property (weak, nonatomic) IBOutlet UILabel *answerTitle;
@property (weak, nonatomic) IBOutlet UILabel *answerContent;
@property (weak, nonatomic) IBOutlet UILabel *sEditorLB;
@property (weak, nonatomic) IBOutlet UIButton *priseNumLB;
@property (weak, nonatomic) IBOutlet UIImageView *queImg;

@end
