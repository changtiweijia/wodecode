//
//  CTPerfectDetailViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/5.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTPerfectDetailViewController.h"
#import "CTBasicDetailViewController.h"
#import "CTProfessionViewController.h"
#import "CTIDViewController.h"
#import "CTTestTableViewController.h"
#import "CTProTableViewController.h"


@interface CTPerfectDetailViewController ()

@end

@implementation CTPerfectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"完善资料";
}
//进入基本信息界面
- (IBAction)enterBasic:(UIButton *)sender
{
    [self.navigationController pushViewController:[CTTestTableViewController new] animated:YES];
}
//进入专业信息界面
- (IBAction)enterProfession:(UIButton *)sender
{
   [self.navigationController pushViewController:[CTProTableViewController new] animated:YES];
}
//进入身份认证界面
- (IBAction)enterID:(UIButton *)sender
{
    [self.navigationController pushViewController:[CTIDViewController new] animated:YES];
}
//光合教练协议webView
- (IBAction)AirCoachDelegate:(UIButton *)sender
{
    
}
//提交审核
- (IBAction)submitDetail:(UIButton *)sender
{
    
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
