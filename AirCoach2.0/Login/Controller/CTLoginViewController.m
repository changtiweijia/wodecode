//
//  CTLoginViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/5.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTLoginViewController.h"
#import "CTRegistViewController.h"
#import "CTMainViewController.h"
@interface CTLoginViewController ()

@end

@implementation CTLoginViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)EnterMian:(UIButton *)sender
{
    [self presentViewController:[CTMainViewController new] animated:YES completion:nil];
}
- (IBAction)gotoRegist:(UIButton *)sender {
    
    [self.navigationController pushViewController:[CTRegistViewController new] animated:YES];
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
