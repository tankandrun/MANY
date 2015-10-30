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
        [self.queVM refreshDataCompletionHandle:^(NSError *error) {
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
    MANYQueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.cell = cell;
    [self configureCell];
    return cell;
}
- (void)configureCell {
    self.cell.dateLB.text = [self.queVM getStrContMarketTime];
    self.cell.questionTitleLB.text = [self.queVM getQueTitle];
    self.cell.questionContent.text = [self.queVM getQueContent];
    self.cell.answerTitle.text = [self.queVM getAnsTitle];
    self.cell.answerContent.text = [self.queVM getAnsContent];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
