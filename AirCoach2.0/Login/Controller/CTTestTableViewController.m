//
//  CTTestTableViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/6.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTTestTableViewController.h"

#import "CTDetailTableViewCell.h"
@interface CTTestTableViewController ()<UITextFieldDelegate>

@end

@implementation CTTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CTDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    
    //背景图
    UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景图@5.5R.png"]];
    backView.frame = self.view.bounds;
    backView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backView atIndex:0];
    
    //定义头部视图
    [self SetHeaderView];
    
    //隐藏底部多余线
    [self setExtraCellLineHidden:self.tableView];
    
    //去掉底线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}
-(void)SetHeaderView
{
    UIView *Header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    //头像按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.frame.size.width / 2-50, 50, 100, 100);
    //btn.backgroundColor = [UIColor blackColor];
    [btn setBackgroundImage:[UIImage imageNamed:@"用户_默认底图.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoPicture:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *Lab = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 40, 120, 100, 100)];
    Lab.text = @"上传头像";
    Lab.textColor = [UIColor whiteColor];
    [Header addSubview:btn];
    [Header addSubview:Lab];
    self.tableView.tableHeaderView = Header;
}
//跳到相册
-(void)gotoPicture:(UIButton*)sender
{
    
}
//多余cell分割线去掉
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    UIButton *EnTure = [UIButton buttonWithType:UIButtonTypeCustom];
    EnTure.frame = CGRectMake(10, 450, self.view.frame.size.width-20, 50);
    [EnTure setTitle:@"完成" forState:UIControlStateNormal];
    EnTure.backgroundColor = [UIColor orangeColor];
    [EnTure addTarget:self action:@selector(backRegist:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:EnTure];
    [self.tableView bringSubviewToFront:EnTure];
    [tableView setTableFooterView:view];
}
-(void)backRegist:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    if (cell==nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
        switch (indexPath.row) {
        case 0:
            cell.Item.text = @"真实姓名";
            cell.EnterTextfield.placeholder = @"请输入您的姓名";
            //cell.EnterTextfield.keyboardType = UIKeyboardAppearanceDefault;
            break;
        case 1:
            cell.Item.text = @"性别";
            cell.EnterTextfield.placeholder = @"请输入您的性别";
            break;
        case 2:
            cell.Item.text = @"年龄";
            cell.EnterTextfield.placeholder = @"请输入您的年龄";
            cell.EnterTextfield.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case 3:
            cell.Item.text = @"常住地";
            cell.EnterTextfield.placeholder = @"请输入您的地址";
            break;
        case 4:
            cell.Item.text = @"简介";
            cell.EnterTextfield.placeholder = @"不超过15个字";
            break;
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    cell.EnterTextfield.delegate = self;
    //改变占位字的大小和颜色
    [cell.EnterTextfield setValue:[UIColor colorWithWhite:0.7 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];
    [cell.EnterTextfield setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    return cell;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

