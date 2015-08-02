//
//  LoginTableViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "LoginTableViewController.h"

@interface LoginTableViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *identityTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;



@end

@implementation LoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    self.identityTextField.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"identity"];
    
    
}
- (IBAction)submitButtonDidPressed:(id)sender {
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    [accountDefaults setValue:self.nameTextField.text forKey:@"name"];
    [accountDefaults setValue:self.identityTextField.text forKey:@"identity"];
    [accountDefaults setValue:self.passwordTextField.text forKey:@"password"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.nameTextField resignFirstResponder];
    [self.identityTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
