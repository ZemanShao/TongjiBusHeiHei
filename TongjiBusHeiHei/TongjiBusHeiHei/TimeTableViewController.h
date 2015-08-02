//
//  TimeTableViewController.h
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TJBRoute.h"


@interface TimeTableViewController : UITableViewController

@property (nonatomic, strong) TJBRoute *route;

@end
