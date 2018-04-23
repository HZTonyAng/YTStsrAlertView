//
//  YTStsrAlertView.h
//  YTStsrAlertView
//
//  Created by TonyAng on 2018/4/20.
//  Copyright © 2018年 TonyAng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTStsrAlertView : UIView

@property (nonatomic, copy) void(^ytAlertViewMakeSureBlock)(
    NSInteger service_attitude_starNum,/*服务态度星数*/
    NSString *service_attitude_evaluate_str,/*服务态度评价*/
    NSInteger solve_speed_starNum,/*解决速度星数*/
    NSString *solve_speed_evaluate_str,/*解决速度评价*/
    NSInteger satisfaction_starNum,/*满意度星数*/
    NSString *satisfaction_evaluate_str,/*满意度评价*/
    NSString *evaluate_content_str/*输入评价内容*/
    );//评价

@property (nonatomic, copy) void(^ytAlertViewCloseBlock)(void);//取消

-(void)show;//弹出

@end

