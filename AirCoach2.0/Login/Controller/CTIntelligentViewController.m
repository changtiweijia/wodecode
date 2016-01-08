//
//  CTIntelligentViewController.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/6.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTIntelligentViewController.h"
#import "CTProfessiion.h"
#import "CTProTableViewController.h"
@interface CTIntelligentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *InputCer;
@property(nonatomic,strong)NSMutableArray *data;

@end

@implementation CTIntelligentViewController

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加资质";
    //添加观察者
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(text) name:UITextFieldTextDidChangeNotification object:self.InputCer];
    
}
-(void)textChange
{
   //按钮可以被点击
}
- (IBAction)backRegist:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(addProfession:didAddProfession:)]) {
        CTProfessiion *pro = [CTProfessiion new];
        pro.Item = self.InputCer.text;
        pro.SubItem = @"1";
        [self.delegate addProfession:self didAddProfession:pro];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
