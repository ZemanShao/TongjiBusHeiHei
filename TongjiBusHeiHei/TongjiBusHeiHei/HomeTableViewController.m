//
//  HomeTableViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "HomeTableViewController.h"
#import "LoginTableViewController.h"
#import "RouteTableViewController.h"
#import "CustomTableViewController.h"
@interface HomeTableViewController ()

@end

@implementation HomeTableViewController


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        if ([self checkSetting]) {
            RouteTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RouteTableViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }

    }
    else if (indexPath.row == 1){
        CustomTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomTableViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (IBAction)settingButtonDidPressed:(id)sender {
    LoginTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginTableViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)checkSetting{
    NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    NSString *identity = [[NSUserDefaults standardUserDefaults]objectForKey:@"identity"];
    if (!name || !identity) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"请点击右上角的设置" delegate:nil cancelButtonTitle:@"好哒" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    else{
        return YES;
    }
    
}

@end
