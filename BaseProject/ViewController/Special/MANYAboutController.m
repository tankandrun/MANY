//
//  MANYAboutController.m
//  MANY
//
//  Created by soft on 15/10/30.
//  Copyright © 2015年 Main. All rights reserved.
//

#import "MANYAboutController.h"

@interface MANYAboutController ()

@end

@implementation MANYAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
#warning 返回键的设置
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = CGRectMake(0, 0, kWindowW, kWindowH);
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.wufazhuce.com/about?from=ONEApp"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
