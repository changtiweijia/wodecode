//
//  CTMainViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/7.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTMainViewController.h"
#import "CTMemberTableViewController.h"
#import "CTPlanTableViewController.h"
#import "CTMeTableViewController.h"
@interface CTMainViewController ()

@end

@implementation CTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tabbarNames = [NSArray arrayWithObjects:@"学员管理",@"计划管理",@"我",nil];
    //未选中相册数组
    NSArray *imageName = [NSArray arrayWithObjects:@"本周计划-未选中", @"发现-未选中", @"我-未选中",nil];
    //选中相册数组
    NSArray *selectedImageName = [NSArray arrayWithObjects:@"本周计划-选中",@"发现-选中",@"我-选中", nil];
    
    NSArray *vcName = [NSArray arrayWithObjects:@"CTMemberTableViewController",@"CTPlanTableViewController",@"CTMeTableViewController",nil];
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0; i < 3; i++)
    {
        Class cl = NSClassFromString(vcName[i]);
        UITableViewController *vc = [[cl alloc]init];
        UINavigationController *vi = [[UINavigationController alloc]initWithRootViewController:vc];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:tabbarNames[i] image:[UIImage imageNamed:imageName[i]] selectedImage:[UIImage imageNamed:selectedImageName[i]]];
        vi.navigationItem.titleView.userInteractionEnabled = YES;
        vi.tabBarItem = item;
        [vcArr addObject:vi];
    }
    
    self.tabBar.tintColor =  [UIColor whiteColor];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbarBackground"];
    self.viewControllers = vcArr;
    
    
    
    
    
    
    
    
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
