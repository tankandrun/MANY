//
//  MANYQueViewModel.h
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseViewModel.h"
#import "MANYQueModel.h"
@interface MANYQueViewModel : BaseViewModel
@property (nonatomic)NSInteger row;

@property (nonatomic,strong)NSMutableArray *queDataArr;

- (MANYQueDetailModel *)getModel;

- (NSString *)getStrContMarketTime;
- (NSString *)getQueTitle;
- (NSString *)getQueContent;
- (NSString *)getAnsTitle;
- (NSString *)getAnsContent;
- (NSString *)getSEditor;
- (NSString *)getPn;

@end
