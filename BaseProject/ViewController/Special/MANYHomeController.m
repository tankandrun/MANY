//
//  MANYHomeController.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYHomeController.h"
#import "MANYHomeViewModel.h"
#import "MANYHomeCell.h"
#import "MANYTool.h"
//#import "iCarousel.h"

@interface MANYHomeController ()
@property (nonatomic,strong)MANYHomeViewModel *homeVM;
@property (nonatomic,strong)MANYHomeCell *cell;

//@property (nonatomic,strong)iCarousel *ic;
@end

@implementation MANYHomeController
//- (iCarousel *)ic {
//    if (!_ic) {
//        _ic = [iCarousel new];
//        _ic.delegate = self;
//        _ic.dataSource = self;
//        _ic.type = iCarouselTypeLinear;
//        _ic.pagingEnabled = YES;
//        _ic.autoscroll = 0;
//    }
//    return _ic;
//}
- (MANYHomeViewModel *)homeVM {
    if (!_homeVM) {
        _homeVM = [MANYHomeViewModel new];
    }
    return _homeVM;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //配置Navigation
    self.navigationItem.titleView = [MANYTool addTopLogo];
    self.navigationItem.rightBarButtonItem = [MANYTool addButtonAndTarget:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.ic];
//    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
//    [self.ic addSubview:self.tableView];
    
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.navigationController.navigationBar.nightBarTintColor = kRGBColor(0, 0, 0);
    self.view.nightBackgroundColor = kRGBColor(40, 40, 40);

    //配置初始界面
    [MANYTool getInterFaceWithTableView:self.tableView usingViewModel:self.homeVM atSuperView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MANYHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.cell = cell;
    [self configureCell];
    return cell;
}
//配置各个控件的内容
- (void)configureCell {
    self.cell.strHpTitle.text = [self.homeVM getStrHpTitle];
    [self.cell.image setImageWithURL:[self.homeVM getThumbnailUrl]];
    self.cell.content.text = [self.homeVM getStrContent];
    [self.cell.strPn setTitle:[self.homeVM getStrPn].stringValue forState:(UIControlStateNormal)];
    self.cell.zuoZhe.text = [[self.homeVM getStrAuther] componentsSeparatedByString:@"&"][0];
    self.cell.zuoPin.text = [[self.homeVM getStrAuther] componentsSeparatedByString:@"&"][1];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd&MMM ,yyyy"];
    NSString *dateStr = [formatter stringFromDate:[MANYTool dateFromString:[self.homeVM getStrMarketTime]]];
    NSArray *arr = [dateStr componentsSeparatedByString:@"&"];
    self.cell.day.text = arr[0];
    self.cell.day.textColor = myTintRGB;
    self.cell.monthYear.text = [NSString stringWithFormat:@"%@",arr[1]];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWindowH-64-49;
}

//#pragma mark - iCarousel
//- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
//    return 5;
//}
//- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
//    if (!view) {
//        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
//        [view addSubview:self.tableView];
//        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(0);
//        }];
//    }
//    return view;
//}



@end
