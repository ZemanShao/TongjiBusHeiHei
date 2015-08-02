//
//  TJBRoute.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "TJBRoute.h"

@implementation TJBRoute

+(TJBRoute *)routeWithDic:(NSDictionary *)dic{
    TJBRoute *route = [[TJBRoute alloc]init];
    route.routeId = [dic[@"route_id"] integerValue];
    route.start = dic[@"start"];
    route.end = dic[@"end"];
    return route;
}

@end
