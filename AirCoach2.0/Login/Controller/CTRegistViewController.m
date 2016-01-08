//
//  CTRegistViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/5.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTRegistViewController.h"
#import "CTPerfectDetailViewController.h"
@interface CTRegistViewController ()

@end

@implementation CTRegistViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"注册";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


//返回主界面
- (IBAction)backMian:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//发送验证码
- (IBAction)sendCode:(UIButton *)sender
{
    
    
}
//跳转至完善资料页面
- (IBAction)gotoNextDetail:(UIButton *)sender
{
    [self.navigationController pushViewController:[CTPerfectDetailViewController new] animated:YES];
   
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
