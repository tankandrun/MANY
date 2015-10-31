//
//  MANYHomeCell.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYHomeCell.h"

@implementation MANYHomeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)StrPnClick:(id)sender {
    self.strPn.selected = !self.strPn.isSelected;
}

@end
