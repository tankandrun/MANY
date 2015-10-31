//
//  MANYPersonalController.m
//  MANY
//
//  Created by soft on 15/10/26.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYPersonalController.h"
#import "MANYAboutController.h"
#import "MANYSettingController.h"
@interface MANYPersonalController ()

@end

@implementation MANYPersonalController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIImageView *topLogo = [[UIImageView alloc]init];
    topLogo.contentMode = UIViewContentModeScaleAspectFit;
    topLogo.image = [UIImage imageNamed:@"navLogo"];
    topLogo.frame = CGRectMake(0, 0, 100, 18);
    self.navigationItem.titleView = topLogo;
    
}
kRemoveCellSeparator
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = myTextRGB;
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"p_notLogin"];
        cell.textLabel.text = @"立即登陆";
    }else if (indexPath.row == 1) {
        cell.imageView.image = [UIImage imageNamed:@"setting"];
        cell.textLabel.text = @"设置";
    }else {
        cell.imageView.image = [UIImage imageNamed:@"copyright"];
        cell.textLabel.text = @"关于";
    }
    return cell;
}
#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1) {
        MANYSettingController *settingVC = [[MANYSettingController alloc]init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }else {
        MANYAboutController *aboutVC = [[MANYAboutController alloc]init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68;
}

@end
