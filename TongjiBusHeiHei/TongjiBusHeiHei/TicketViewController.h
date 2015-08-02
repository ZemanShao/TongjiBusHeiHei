//
//  TicketViewController.h
//  TongjiBusHeiHei
//
//  Created by Nathan on 7/19/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "ViewController.h"

@interface TicketViewController : ViewController
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *identity;
@property (nonatomic, strong) NSString *date;
@property BOOL isFromJiading;

@property (nonatomic, strong) NSString *detail;

@end
