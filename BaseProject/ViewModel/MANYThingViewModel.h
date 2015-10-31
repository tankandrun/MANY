//
//  MANYThingViewModel.h
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseViewModel.h"
#import "MANYThingModel.h"
@interface MANYThingViewModel : BaseViewModel
@property (nonatomic)NSInteger row;

@property (nonatomic,strong)NSMutableArray *thingDataArr;

- (MANYThingDetailModel *)getModel;

- (NSString *)getDateLB;
- (NSString *)getImg;
- (NSString *)getTitle;
- (NSString *)getContent;

@end
