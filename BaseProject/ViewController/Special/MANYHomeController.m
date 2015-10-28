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
@interface MANYHomeController ()
@property (nonatomic,strong)MANYHomeViewModel *homeVM;
@property (nonatomic,strong)MANYHomeCell *cell;

@end

@implementation MANYHomeController
- (MANYHomeViewModel *)homeVM {
    if (!_homeVM) {
        _homeVM = [MANYHomeViewModel new];
    }
    return _homeVM;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //配置Navigation
    UIImageView *topLogo = [[UIImageView alloc]init];
    topLogo.contentMode = UIViewContentModeScaleAspectFit;
    topLogo.image = [UIImage imageNamed:@"navLogo"];
    topLogo.frame = CGRectMake(0, 0, 100, 18);
    self.navigationItem.titleView = topLogo;
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shareBtn"] style:(UIBarButtonItemStyleDone) target:nil action:nil];
    self.navigationItem.rightBarButtonItem = button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
#warning 需要更改为左拉刷新
    //刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.homeVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWindowH-64-49;
}
//配置各个空间的内容

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




@end
