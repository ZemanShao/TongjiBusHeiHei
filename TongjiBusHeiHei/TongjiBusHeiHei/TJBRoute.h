//
//  TJBRoute.h
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJBRoute : NSObject


@property NSUInteger routeId;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *end;

+(TJBRoute *)routeWithDic:(NSDictionary *)dic;


@end
