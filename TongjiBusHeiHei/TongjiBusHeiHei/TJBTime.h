//
//  TJBTime.h
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJBTime : NSObject

@property (nonatomic, strong) NSString *busId;
@property (nonatomic, strong) NSString *line;
@property (nonatomic, strong) NSString *time;


+(TJBTime *)timeWithDic:(NSDictionary *)dic;

@end
