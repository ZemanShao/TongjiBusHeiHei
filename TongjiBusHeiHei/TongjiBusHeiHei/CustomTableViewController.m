//
//  CustomTableViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 8/2/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "CustomTableViewController.h"
#import "TicketViewController.h"

@interface CustomTableViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *identityTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *fromTextField;
@property (weak, nonatomic) IBOutlet UITextField *toTextField;
@property (weak, nonatomic) IBOutlet UITextField *lineTextField;

@property (nonatomic, strong) UIDatePicker *picker;

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTextField];
}

- (void)configureTextField{
    [self.picker addTarget:self action:@selector(pickerValueChanged) forControlEvents:UIControlEventValueChanged];
    self.dateTextField.inputView = self.picker;
}


- (IBAction)submitButtonPressed:(id)sender {
    TicketViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TicketViewController"];
    vc.name = self.nameTextField.text;
    vc.identity = self.identityTextField.text;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    vc.date = [formatter stringFromDate:self.picker.date];
    formatter.dateFormat = @"HH:mm";
    vc.time = [formatter stringFromDate:self.picker.date];
    vc.from = self.fromTextField.text;
    vc.to = self.toTextField.text;
    vc.detail = self.lineTextField.text;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pickerValueChanged{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat =
    @"yyyy-MM-dd HH:mm";
    self.dateTextField.text = [formatter stringFromDate:self.picker.date];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self.nameTextField resignFirstResponder];
    [self.identityTextField resignFirstResponder];
    [self.dateTextField resignFirstResponder];
    [self.fromTextField resignFirstResponder];
    [self.toTextField resignFirstResponder];
//    [self.lineTextField resignFirstResponder];
}

- (UIDatePicker *)picker{
    if (!_picker) {
        _picker = [[UIDatePicker alloc]init];
    }
    return _picker;
}



@end
