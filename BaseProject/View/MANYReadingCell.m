//
//  MANYReadingCell.m
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYReadingCell.h"

@implementation MANYReadingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)click:(id)sender {
    self.pnButton.selected = !self.pnButton.isSelected;
}

@end
