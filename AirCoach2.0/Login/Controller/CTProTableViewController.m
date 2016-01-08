//
//  CTProTableViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/6.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTProTableViewController.h"
#import "CTProfessionTableViewCell.h"
#import "CTProfessiion.h"
#import "CTAcadamicViewController.h"
#import "CTIntelligentViewController.h"

#define DatafilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Intelligent.data"]

@interface CTProTableViewController ()<CTintelligentDelegate>
@property(nonatomic,strong)NSMutableArray *DataArr;
@property(nonatomic,strong)CTProfessiion *Profession;
@property(nonatomic,strong)CTIntelligentViewController *vc;
@end

@implementation CTProTableViewController

-(CTIntelligentViewController *)vc
{
    if (!_vc) {
        _vc = [CTIntelligentViewController new];
    }
    return _vc;
}

-(NSMutableArray *)DataArr
{
    if (!_DataArr) {
        _DataArr = [NSKeyedUnarchiver unarchiveObjectWithFile:DatafilePath];
        if (_DataArr == nil) {
            _DataArr = [NSMutableArray array];
            [_DataArr addObjectsFromArray:[CTProfessiion ShareBasicData]] ;
        }
    }
    return _DataArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Intelligent.data"]);
    [self.tableView registerNib:[UINib nibWithNibName:@"CTProfessionTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    //背景图
    UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景图@5.5R.png"]];
    backView.frame = self.view.bounds;
    backView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backView atIndex:0];
    
    //定义头部视图
    //[self SetHeaderView];
    
    //隐藏底部多余线
    [self setExtraCellLineHidden:self.tableView];
#warning delegate
    //代理位置一定要注意
    self.vc.delegate = self;
    
    
}

//多余cell分割线去掉
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor clearColor];
    UIButton *EnTure = [UIButton buttonWithType:UIButtonTypeCustom];
    EnTure.frame = CGRectMake(10, 400, self.view.frame.size.width-20, 50);
    [EnTure setTitle:@"完成" forState:UIControlStateNormal];
    EnTure.backgroundColor = [UIColor orangeColor];
    [EnTure addTarget:self action:@selector(backRegist:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:EnTure];
    [self.tableView bringSubviewToFront:EnTure];
    // [tableView setTableFooterView:view];
}
-(void)backRegist:(UIButton*)sender
{
    
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.DataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     CTProfessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[CTProfessionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    CTProfessiion *profession = self.DataArr[indexPath.row];
    cell.Item.text = profession.Item;
    cell.subItem.text = profession.SubItem;
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    
    return cell;
}
#pragma mark - CTintelligentDelegate
-(void)addProfession:(CTIntelligentViewController *)addVc didAddProfession:(CTProfessiion *)profession
{
 
    [self.DataArr insertObject:profession atIndex:self.DataArr.count - 1];
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.DataArr toFile:DatafilePath];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self touchProfession];
            break;
        case 1:
            [self gotoAcadamic];
            break;
        case 2:
            [self gotoIntelligent];
            break;
        default:
            break;
    }
}
-(void)gotoIntelligent
{
    
    [self.navigationController pushViewController:self.vc animated:YES];
    
}
-(void)touchProfession
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
-(void)gotoAcadamic
{
    [self.navigationController pushViewController:[CTAcadamicViewController new] animated:YES];
}

@end
