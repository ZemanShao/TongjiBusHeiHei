//
//  TimeTableViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "TimeTableViewController.h"
#import "TJBusClient.h"
#import "TJBTime.h"
#import "TicketViewController.h"

@interface TimeTableViewController ()

@property (nonatomic,strong) NSMutableArray *timeMutableArray;

@end

@implementation TimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshData];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.timeMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"timeCell"];
        
    }
    TJBTime *time = self.timeMutableArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"时间:%@,路线:%@",time.time,time.line];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TicketViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TicketViewController"];
    vc.name = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    vc.identity = [[NSUserDefaults standardUserDefaults]objectForKey:@"identity"];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    vc.date = [formatter stringFromDate:date];
    TJBTime *time = self.timeMutableArray[indexPath.row];
    vc.time = time.time;
    vc.detail = time.line;
    vc.from = [self.route.start substringToIndex:2];
    vc.to = [self.route.end substringToIndex:2];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)refreshData{
    [[TJBusClient sharedClient]getTimeTableWithRouteId:[NSString stringWithFormat:@"%ld",(unsigned long)self.route.routeId] andSuccessBlock:^(NSArray *timeArray){
        if (!timeArray) {
            [[[UIAlertView alloc]initWithTitle:@"错误" message:@"不知道啥错误，但是一定出错了." delegate:nil cancelButtonTitle:@"好哒" otherButtonTitles:nil]show];
            [self.navigationController popViewControllerAnimated:YES];
        }
        for (NSDictionary *dic in timeArray) {
            [self.timeMutableArray addObject:[TJBTime timeWithDic:dic]];
        }
        [self.tableView reloadData];
    }];
}


- (NSMutableArray *)timeMutableArray{
    if (!_timeMutableArray) {
        _timeMutableArray = [[NSMutableArray alloc]init];
    }
    return _timeMutableArray;
}

@end
