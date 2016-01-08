//
//  CTProfessionViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/5.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTProfessionViewController.h"
#import "CTAcadamicViewController.h"
#import "CTIntelligentViewController.h"
@interface CTProfessionViewController ()

@end

@implementation CTProfessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"完善专业信息";
}
- (IBAction)gotoAcatamic:(UIButton *)sender {
    [self.navigationController pushViewController:[CTAcadamicViewController new] animated:YES];
}
- (IBAction)gotoIntellege:(UIButton *)sender {
    [self.navigationController pushViewController:[CTIntelligentViewController new] animated:YES];
}

- (IBAction)pushAlertView:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择专长" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *firstAC = [UIAlertAction actionWithTitle:@"塑形" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *SecondAC = [UIAlertAction actionWithTitle:@"减脂" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *ThreeAC = [UIAlertAction actionWithTitle:@"耐力" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *FourAC = [UIAlertAction actionWithTitle:@"增强力量" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *DoneAC = [UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:firstAC];
    [alertController addAction:SecondAC];
    [alertController addAction:ThreeAC];
    [alertController addAction:FourAC];
    [alertController addAction:DoneAC];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
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
