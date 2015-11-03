//
//  MANYSettingController.m
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYSettingController.h"

@interface MANYSettingController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation MANYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.nightBarTintColor = kRGBColor(0, 0, 0);
//    self.view.nightBackgroundColor = kRGBColor(40, 40, 40);

    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.frame;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = nil;
    tableView.nightBackgroundColor = kRGBColor(40, 40, 40);
    tableView.tableHeaderView.nightBackgroundColor = kRGBColor(40, 40, 40);
    self.tableView = tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 1;
    }else if (section == 2) {
        return 4;
    }else {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"setting"];
        cell.textLabel.textColor = myTextRGB;
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"夜间模式切换";
        UISwitch *sw = [[UISwitch alloc]init];
        cell.accessoryView = sw;
        [sw bk_addEventHandler:^(id sender) {
            if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
                [DKNightVersionManager dawnComing];
            } else {
                [DKNightVersionManager nightFalling];
            }
//            sw.selected = !sw.isSelected;
//            [self.tableView reloadData];
        } forControlEvents:(UIControlEventValueChanged)];
        
    }else if (indexPath.section == 1) {
        cell.textLabel.text = @"清除缓存";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"去评分";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"反馈";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 2) {
            cell.textLabel.text = @"用户协议";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else {
            cell.textLabel.text = @"版本号";
            cell.detailTextLabel.text = @"2.5.1";
            cell.userInteractionEnabled = NO;
        }
    }else {
#warning 没有帐号登录时不显示
        cell.textLabel.text = @"退出当前账号";
    }
//    cell.textLabel.nightTextColor = kRGBColor(150, 150, 150);
//    cell.nightBackgroundColor = kRGBColor(20, 20, 20);
    return cell;
}
#pragma mark - UITableViewDelegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"浏览设置";
    }else if (section == 1) {
        return @"缓存设置";
    }else if (section == 2) {
        return @"更多";
    }else {
        return @" ";
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
