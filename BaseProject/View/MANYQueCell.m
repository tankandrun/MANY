//
//  MANYQueCell.m
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYQueCell.h"

@implementation MANYQueCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)click:(id)sender {
    self.priseNumLB.selected = !self.priseNumLB.isSelected;
}

@end
