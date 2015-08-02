//
//  TJBTime.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "TJBTime.h"

@implementation TJBTime

+(TJBTime *)timeWithDic:(NSDictionary *)dic{
    TJBTime *time = [[TJBTime alloc]init];
    time.busId = dic[@"bus_id"];
    time.line = dic[@"line" ];
    time.time = dic[@"time"];
    return time;
}

@end
