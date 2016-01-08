//
//  CTFirstViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/5.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTFirstViewController.h"
#import "CTLoginViewController.h"
#import "CTRegistViewController.h"
#import "CTProfessiion.h"
#import "CTTestTableViewController.h"
@interface CTFirstViewController ()
@property(nonatomic,strong)UIButton *LoginButton;
@property(nonatomic,strong)UIButton *RegistButton;
@end

@implementation CTFirstViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [CTProfessiion ShareBasicData];
    //背景图
    
    UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景图@5.5R.png"]];
    backView.frame = self.view.bounds;
    backView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backView atIndex:0];
    
    //登录按钮
    
    self.LoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //此处加约束
    self.LoginButton.frame = CGRectMake(20, 500, 150, 50);
    [self.LoginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.LoginButton setBackgroundColor:[UIColor grayColor]];
    [self.LoginButton addTarget:self action:@selector(LoginNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.LoginButton];
    
    //注册按钮
    
    self.RegistButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //此处加约束
    self.RegistButton.frame = CGRectMake(200, 500, 150, 50);
    [self.RegistButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.RegistButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.RegistButton addTarget:self action:@selector(RegistNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.RegistButton];
    
    
    
    
    
    
    
    
    
    
}
-(void)LoginNext:(UIButton*)sender
{
    [self.navigationController pushViewController:[CTLoginViewController new] animated:YES];
}

-(void)RegistNext:(UIButton*)sender
{
    //[self presentViewController:[CTRegistViewController new] animated:YES completion:nil];
    [self.navigationController pushViewController:[CTRegistViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
