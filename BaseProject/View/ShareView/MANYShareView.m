//
//  MANYShareView.m
//  MANY
//
//  Created by 金顺度 on 15/11/3.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYShareView.h"
#import "UIView+TYAlertView.h"
//#import "UMSocial.h"

@interface MANYShareView()
@property (weak, nonatomic) IBOutlet UILabel *nightLB;
@property (weak, nonatomic) IBOutlet UIButton *colBtn;

@end

@implementation MANYShareView
- (IBAction)dismiss:(id)sender {
    [self hideView];
}
- (IBAction)addCollection:(id)sender {
    
    self.colBtn.selected = !self.colBtn.isSelected;
    if (self.colBtn.selected) {
        NSLog(@"加入收藏");
    }
}
- (IBAction)saveImg:(id)sender {
    [self hideView];
    NSLog(@"保存图片");
}
- (IBAction)fontChange:(id)sender {
    [self hideView];
    NSLog(@"改字体");
    
//    [UMSocialSnsService presentSnsIconSheetView:[self viewController]
//                                         appKey:@"507fcab25270157b37000010"
//                                      shareText:@"你要分享的文字"
//                                     shareImage:[UIImage imageNamed:@"icon.png"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,nil]
//                                       delegate:nil];
}
- (IBAction)nightMod:(id)sender {
    [self hideView];
    self.nightLB.text = @"日间模式";
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        [DKNightVersionManager dawnComing];
    } else {
        [DKNightVersionManager nightFalling];
    }
    
    
}
//获取到当前view的Controller
- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
