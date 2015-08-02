//
//  RouteTableViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "RouteTableViewController.h"
#import "TJBusClient.h"
#import "TJBRoute.h"
#import "TimeTableViewController.h"

@interface RouteTableViewController ()

@property (nonatomic,strong) NSMutableArray *routeMutableArray;

@end

@implementation RouteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshData];
    
}


- (void)refreshData{
    NSString *identity = [[NSUserDefaults standardUserDefaults]objectForKey:@"identity"];
    NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    [[TJBusClient sharedClient]getAllRouteWithID:identity
                                        password:password
                                 andSuccessBlock:^(NSDictionary *dic){
                                     if (!dic) {
                                         [[[UIAlertView alloc]initWithTitle:@"错误" message:@"不知道啥错误，但是一定出错了." delegate:nil cancelButtonTitle:@"好哒" otherButtonTitles:nil]show];
                                         [self.navigationController popViewControllerAnimated:YES];
                                     }
                                     NSLog(@"%@",dic);
                                     NSArray *routeArray = dic[@"routelist"];
                                     for (NSDictionary *routeDic in routeArray) {
                                         TJBRoute *route = [TJBRoute routeWithDic:routeDic];
                                         [self.routeMutableArray addObject:route];
                                     }
                                     [self.tableView reloadData];
                                 }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.routeMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routeCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"routeCell"];
    }
    TJBRoute *route = self.routeMutableArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"从%@到%@",route.start,route.end];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    TimeTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TimeTableViewController"];
    TJBRoute *route = self.routeMutableArray[indexPath.row];
    vc.route = route;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSMutableArray *)routeMutableArray{
    if (!_routeMutableArray) {
        _routeMutableArray = [[NSMutableArray alloc]init];
    }
    return _routeMutableArray;
}
@end
