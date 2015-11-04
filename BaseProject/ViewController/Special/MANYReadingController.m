//
//  MANYReadingController.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYReadingController.h"
#import "MANYReadingCell.h"
#import "MANYReadingViewModel.h"
#import "MANYTool.h"
@interface MANYReadingController ()
@property (nonatomic,strong)MANYReadingCell *cell;
@property (nonatomic,strong)MANYReadingViewModel *readingVM;

@end

@implementation MANYReadingController
- (MANYReadingViewModel *)readingVM {
    if (!_readingVM) {
        _readingVM = [MANYReadingViewModel new];
    }
    return _readingVM;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationItem.titleView = [MANYTool addTopLogo];
    self.navigationItem.rightBarButtonItem = [MANYTool addButtonAndTarget:self];

//    self.navigationItem.rightBarButtonItem = [MANYTool addButton];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.nightBarTintColor = kRGBColor(0, 0, 0);
    self.view.nightBackgroundColor = kRGBColor(40, 40, 40);

    //配置初始界面
    [MANYTool getInterFaceWithTableView:self.tableView usingViewModel:self.readingVM atSuperView:self.view];

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

    MANYReadingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne" ];
    self.cell = cell;
    [self configureCell];
    return cell;
}
- (void)configureCell {
    self.cell.TitleLB.text = [self.readingVM getStrContTitle];
    self.cell.zuozheLB.text = [self.readingVM getStrContAuthor];
    self.cell.dazuozheLB.text = [self.readingVM getStrContAuthor];
    self.cell.contentLB.text = [[self.readingVM getStrContent] stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    self.cell.introduceLB.text = [self.readingVM getStrContAuthorIntroduce];
    [self.cell.pnButton setTitle:[self.readingVM getStrPraiseNumber] forState:(UIControlStateNormal)];
    self.cell.zuozheweiboLB.text = [self.readingVM getsWbN];
    self.cell.zuozheIntroLB.text = [self.readingVM getsAuth];
    self.cell.dateLB.text = [self.readingVM getStrContMarketTime];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = self.cell.zuozheLB.frame.origin.y + self.cell.zuozheLB.frame.size.height;
    //获取文章LB的高度
    CGRect rectOfContent = CGRectMake(0, 0, kWindowW-20, 20000);
    rectOfContent = [self.cell.contentLB textRectForBounds:rectOfContent limitedToNumberOfLines:0];
    //获取introduceLB的高度
    CGRect rectOfIntroduceLB = CGRectMake(0, 0, kWindowW-20, 999);
    rectOfIntroduceLB = [self.cell.introduceLB textRectForBounds:rectOfIntroduceLB limitedToNumberOfLines:0];
    //获取zuozheIntroLB的高度
    CGRect rectOfZuozheIntroLB = CGRectMake(0, 0, kWindowW-20, 999);
    rectOfZuozheIntroLB = [self.cell.zuozheIntroLB textRectForBounds:rectOfZuozheIntroLB limitedToNumberOfLines:0];
 
    height = height+rectOfContent.size.height*1.0+rectOfIntroduceLB.size.height*1.0+rectOfZuozheIntroLB.size.height*1.0+90+25+60+60;
    NSLog(@"%f",height);
    return height;
}


@end
