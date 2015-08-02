//
//  TicketViewController.m
//  TongjiBusHeiHei
//
//  Created by Nathan on 7/19/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

#import "TicketViewController.h"

@interface TicketViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *identityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *trackImageView;

@property (weak, nonatomic) IBOutlet UIImageView *carImageView;

@end

@implementation TicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureContent];
    [self configureProgressView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [self addAnimation];
}

- (void)applicationWillEnterForeground{
    [self addAnimation];
}

- (void)applicationDidEnterBackground{
    [self.view.layer removeAllAnimations];
    self.trackImageView.frame = CGRectMake(83, 182, 10, 9);
    self.carImageView.frame = CGRectMake(77, 142, 47, 32);
}

- (void)addAnimation{
    [UIView animateWithDuration:10.0
                          delay:0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.trackImageView.frame = CGRectMake(83, 182, 166, 9);
                         self.carImageView.frame = CGRectMake(220, 142, 47, 32);
                     }
                     completion:^(BOOL completed){
                         self.trackImageView.frame = CGRectMake(83, 182, 10, 9);
                         self.carImageView.frame = CGRectMake(77, 142, 47, 32);
                     }
     ];
}


- (void)configureProgressView{
    
    UIImage *track = [UIImage imageNamed:@"bar_track"];
    self.trackImageView.image = [track resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    
    
}

- (void)configureContent{
    self.nameLabel.text = self.name;
    self.identityLabel.text = self.identity;

    self.dateLabel.text = [NSString stringWithFormat:@"%@ %@",self.date,self.time];
    self.fromLabel.text = self.from;
    self.toLabel.text = self.to;
    self.detailLabel.text = self.detail;
    if ([self.from isEqualToString:@"嘉定"]) {
        self.imageView.image = [UIImage imageNamed:@"jiading"];
    }
    else if([self.from isEqualToString:@"四平"]){
        self.imageView.image = [UIImage imageNamed:@"siping"];
    }
    else if([self.from isEqualToString:@"沪西"]){
        self.imageView.image = [UIImage imageNamed:@"huxi"];
    }
    else if([self.from isEqualToString:@"曹杨"]){
        self.imageView.image = [UIImage imageNamed:@"caoyang"];
    }
    else if([self.from isEqualToString:@"同济"]){
        self.imageView.image = [UIImage imageNamed:@"beiyuan"];
    }
    
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
