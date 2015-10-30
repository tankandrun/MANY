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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.allowsSelection = NO;
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.thingVM refreshDataCompletionHandle:^(NSError *error) {
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
    
    return height+rectOfTitle.size.height*1.0+90+rectOfContent.size.height*1.0+40;

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
