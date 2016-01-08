//
//  CTProfessiion.m
//  AirCoach2.0
//
//  Created by 高静 on 16/1/6.
//  Copyright © 2016年 高静. All rights reserved.
//

#import "CTProfessiion.h"

@implementation CTProfessiion


- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.Item forKey:@"name"];
    [encoder encodeObject:self.SubItem forKey:@"phone"];
}
/*
 解析对象会调用这个方法
 需要解析哪些属性
 */
- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.Item = [decoder decodeObjectForKey:@"name"];
        self.SubItem = [decoder decodeObjectForKey:@"phone"];
    }
    return self;
}

+(NSMutableArray *)ShareBasicData
{

    
            NSArray *dataArr = nil;
            CTProfessiion *data1 = [CTProfessiion new];
            data1.Item = @"专长";
            data1.SubItem = @"可选两个";
            
            CTProfessiion *data2 = [CTProfessiion new];
            data2.Item = @"学历";
            data2.SubItem = @"请添加";
            
            CTProfessiion *data3 = [CTProfessiion new];
            data3.Item = @"资质";
            data3.SubItem = @"请添加";
            dataArr = @[data1,data2,data3];
    
    return [dataArr copy];
    
}

@end
