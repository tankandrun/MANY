//
//  MANYThingController.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYThingController.h"
#import "MANYThingCell.h"
#import "MANYThingViewModel.h"
#import "MANYTool.h"
@interface MANYThingController ()
@property (nonatomic,strong)MANYThingViewModel *thingVM;
@property (nonatomic,strong)MANYThingCell *cell;

@end

@implementation MANYThingController
- (MANYThingViewModel *)thingVM {
    if (!_thingVM) {
        _thingVM = [MANYThingViewModel new];
    }
    return _thingVM;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationItem.titleView = [MANYTool addTopLogo];
    self.navigationItem.rightBarButtonItem = [MANYTool addButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.nightBarTintColor = kRGBColor(0, 0, 0);
    self.view.nightBackgroundColor = kRGBColor(40, 40, 40);

    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.allowsSelection = NO;
    
    //配置初始界面
    [MANYTool getInterFaceWithTableView:self.tableView usingViewModel:self.thingVM atSuperView:self.view];
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
    MANYThingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.cell = cell;
    [self configureCell];
    return cell;
}
- (void)configureCell {
    self.cell.dateLB.text = [self.thingVM getDateLB];
    [self.cell.strBULB setImageWithURL:[NSURL URLWithString:[self.thingVM getImg]]];
    self.cell.strTtLB.text = [self.thingVM getTitle];
    self.cell.strTcLB.text = [self.thingVM getContent];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = self.cell.strBULB.frame.origin.y + self.cell.strBULB.frame.size.height;
    //获取QUELB的高度
    CGRect rectOfTitle = CGRectMake(0, 0, kWindowW-130, 999);
    rectOfTitle = [self.cell.strTtLB textRectForBounds:rectOfTitle limitedToNumberOfLines:0];
    //获取ANSLB的高度
    CGRect rectOfContent = CGRectMake(0, 0, kWindowW-20, 999);
    rectOfContent = [self.cell.strTcLB textRectForBounds:rectOfContent limitedToNumberOfLines:0];
    
    return height+rectOfTitle.size.height*1.0+80+rectOfContent.size.height*1.0;
}



@end
