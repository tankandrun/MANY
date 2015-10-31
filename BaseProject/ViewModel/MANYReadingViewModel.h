//
//  MANYReadingViewModel.h
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "BaseViewModel.h"
#import "MANYReadingModel.h"
@interface MANYReadingViewModel : BaseViewModel
@property (nonatomic)NSInteger row;
@property (nonatomic,strong)NSMutableArray *readingDataArr;

- (MANYReadingContentModel *)getModel;

- (NSString *)getStrContMarketTime;
- (NSString *)getStrContent;
- (NSString *)getStrContTitle;
- (NSString *)getStrContAuthor;
- (NSString *)getStrContAuthorIntroduce;
- (NSString *)getStrPraiseNumber;
- (NSString *)getsWbN;
- (NSString *)getsAuth;
@end
