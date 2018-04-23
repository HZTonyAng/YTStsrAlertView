//
//  ViewController.m
//  YTStsrAlertView
//
//  Created by TonyAng on 2018/4/20.
//  Copyright © 2018年 TonyAng. All rights reserved.
//

#import "ViewController.h"
#import "YTStsrAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"YTStsrAlertView";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.center = self.view.center;
    button.backgroundColor = [UIColor cyanColor];
    [button addTarget:self action:@selector(butttonAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)butttonAction{
    YTStsrAlertView *alertView = [YTStsrAlertView new];
    [alertView show];
    alertView.ytAlertViewCloseBlock = ^{
        NSLog(@"取消了------VC");
    };
    
    alertView.ytAlertViewMakeSureBlock = ^(NSInteger service_attitude_starNum, NSString *service_attitude_evaluate_str, NSInteger solve_speed_starNum, NSString *solve_speed_evaluate_str, NSInteger satisfaction_starNum, NSString *satisfaction_evaluate_str, NSString *evaluate_content_str) {
        NSLog(@"评论了------VC");
    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
