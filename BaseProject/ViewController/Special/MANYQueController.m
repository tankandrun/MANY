//
//  MANYQueController.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYQueController.h"
#import "MANYQueCell.h"
#import "MANYQueViewModel.h"
#import "MANYTool.h"
@interface MANYQueController ()
@property (nonatomic,strong)MANYQueViewModel *queVM;
@property (nonatomic,strong)MANYQueCell *cell;

@end

@implementation MANYQueController
- (MANYQueViewModel *)queVM {
    if (!_queVM) {
        _queVM = [MANYQueViewModel new];
    }
    return _queVM;
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

    //配置初始界面
    [MANYTool getInterFaceWithTableView:self.tableView usingViewModel:self.queVM atSuperView:self.view];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MANYQueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.cell = cell;
    [self configureCell];
    return cell;
}
- (void)configureCell {
    self.cell.dateLB.text = [self.queVM getStrContMarketTime];
    self.cell.questionTitleLB.text = [self.queVM getQueTitle];
    self.cell.questionContent.text = [[self.queVM getQueContent] stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    self.cell.answerTitle.text = [self.queVM getAnsTitle];
    self.cell.answerContent.text = [[self.queVM getAnsContent] stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    [self.cell.priseNumLB setTitle:[self.queVM getPn] forState:(UIControlStateNormal)];
    self.cell.sEditorLB.text = [self.queVM getSEditor];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = self.cell.queImg.frame.origin.y + self.cell.queImg.frame.size.height;
    //获取QUELB的高度
    CGRect rectOfQue = CGRectMake(0, 0, kWindowW-20, 999);
    rectOfQue = [self.cell.questionContent textRectForBounds:rectOfQue limitedToNumberOfLines:0];
    //获取ANSLB的高度
    CGRect rectOfAns = CGRectMake(0, 0, kWindowW-20, 20000);
    rectOfAns = [self.cell.answerContent textRectForBounds:rectOfAns limitedToNumberOfLines:0];
    
    return height+rectOfQue.size.height*1.0+90+rectOfAns.size.height*1.0+90+40;
}



@end
