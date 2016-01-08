//
//  CTIntelligentViewController.h
//  AirCoach2.0
//
//  Created by 高静 on 16/1/6.
//  Copyright © 2016年 高静. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTIntelligentViewController,CTProfessiion;
@protocol CTintelligentDelegate <NSObject>

@optional
-(void)addProfession:(CTIntelligentViewController*)addVc didAddProfession:(CTProfessiion*)profession;

@end
//typedef void(^MyBlock)(NSString *text);

@interface CTIntelligentViewController : UIViewController

@property(nonatomic,assign)id<CTintelligentDelegate> delegate;

@end
