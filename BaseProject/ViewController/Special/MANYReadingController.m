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
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.readingVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
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

    MANYReadingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne" ];
    self.cell = cell;
    [self configureCell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    CGRect rect = self.cell.zuozheIntroLB.frame;
//    NSLog(@"%f,%f,%f,%f",rect.origin.x,rect.origin.y,rect.size.height,rect.size.width);
    
    //self.cell.zuozheIntroLB.frame.origin.y+self.cell.zuozheIntroLB.frame.size.height+20
//    return self.cell.zuozheIntroLB.frame.origin.y+self.cell.zuozheIntroLB.frame.size.height+20;
    return self.cell.TitleLB.frame.origin.y + self.cell.TitleLB.frame.size.height + self.cell.contentLB.frame.size.height;
}

- (void)configureCell {
    self.cell.TitleLB.text = [self.readingVM getStrContTitle];
    self.cell.zuozheLB.text = [self.readingVM getStrContAuthor];
    self.cell.dazuozheLB.text = [self.readingVM getStrContAuthor];
    self.cell.contentLB.text = [self.readingVM getStrContent];
    self.cell.introduceLB.text = [self.readingVM getStrContAuthorIntroduce];
    [self.cell.pnButton setTitle:[self.readingVM getStrPraiseNumber] forState:(UIControlStateNormal)];
    self.cell.zuozheweiboLB.text = [self.readingVM getsWbN];
    self.cell.zuozheIntroLB.text = [self.readingVM getsAuth];
    self.cell.dateLB.text = [self.readingVM getStrContMarketTime];
}
@end
