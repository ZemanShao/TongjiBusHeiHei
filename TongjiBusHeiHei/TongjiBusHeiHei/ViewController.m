//
//  ViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 6/25/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "ViewController.h"
#import "TicketViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *identityLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *routeTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (nonatomic, strong) UIDatePicker *picker;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureTextField];
}

- (void)configureTextField{
    [self.picker addTarget:self action:@selector(pickerValueChanged) forControlEvents:UIControlEventValueChanged];
    self.dateTextField.inputView = self.picker;
}

- (IBAction)submit:(id)sender {
    TicketViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TicketViewController"];
    vc.name = self.nameLabel.text;
    vc.identity = self.identityLabel.text;
    vc.date = self.dateTextField.text;
//    vc.isFromJiading = [self.routeTextField.text isEqualToString:@"嘉定"] ? YES : NO;
    vc.detail = self.detailTextField.text;
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (void)pickerValueChanged{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat =
        @"yyyy-MM-dd HH:mm";
    self.dateTextField.text = [formatter stringFromDate:self.picker.date];
}


- (UIDatePicker *)picker{
    if (!_picker) {
        _picker = [[UIDatePicker alloc]init];
    }
    return _picker;
}


@end
