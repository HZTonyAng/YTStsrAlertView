//
//  YTStsrAlertView.m
//  YTStsrAlertView
//
//  Created by TonyAng on 2018/4/20.
//  Copyright © 2018年 TonyAng. All rights reserved.
//

/** 手机屏 比例 */
#define kIphone6Width 375.0
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define kFit(x) (Screen_Width*((x)/kIphone6Width))
#define UIColorFromR_G_B(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//分割线颜色
#define main_line_color             UIColorFromR_G_B(243, 243, 243, 1)

//主题色
#define main_color                  UIColorFromR_G_B(254, 152, 8, 1)

//浅色字体主题色
#define main_font_light_color       UIColorFromR_G_B(153, 153, 153, 1)

//深色字体主题色
#define main_font_deep_color        UIColorFromR_G_B(51, 51, 51, 1)

#import "YTStsrAlertView.h"
#import "Masonry.h"
#import "JWStarView.h"

@interface YTStsrAlertView()<UITextViewDelegate>
@property (nonatomic,strong) UIView *alertview;

@property (nonatomic,strong) UILabel *evaluate_label;//评价

@property (nonatomic,strong) UILabel *service_attitude_label;//服务态度
@property (nonatomic,strong) UILabel *service_attitude_evaluate_label;//服务态度评价
@property (nonatomic, assign) NSInteger service_attitude_starNum;//服务态度星数
@property (nonatomic, copy) NSString *service_attitude_evaluate_str;//服务态度评价

@property (nonatomic,strong) UILabel *solve_speed_label;//解决速度
@property (nonatomic,strong) UILabel *solve_speed_evaluate_label;//解决速度评价
@property (nonatomic, assign) NSInteger solve_speed_starNum;//解决速度星数
@property (nonatomic, copy) NSString *solve_speed_evaluate_str;//解决速度评价

@property (nonatomic,strong) UILabel *satisfaction_label;//满意度
@property (nonatomic,strong) UILabel *satisfaction_evaluate_label;//满意度评价
@property (nonatomic, assign) NSInteger satisfaction_starNum;//满意度星数
@property (nonatomic, copy) NSString *satisfaction_evaluate_str;//满意度评价

@property (nonatomic,strong) UITextView *evaluate_content_textView;//输入评价内容
@property (nonatomic, copy) NSString *evaluate_content_str;//输入评价内容

@property (nonatomic,strong) UILabel *max_textCont_label;//500字内
@property (nonatomic,strong) UIButton *evaluate_cancel_button;//取消
@property (nonatomic,strong) UIButton *evaluate_makeSure_button;//确定

@end

@implementation YTStsrAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.alertview.frame = CGRectMake(Screen_Width/2 - kFit(290)/2, kFit(130) + ([NSStringFromCGSize([UIScreen mainScreen].bounds.size) isEqualToString:@"{375, 812}"] ? 44 : 20), kFit(290), kFit(300));
        //        self.alertview.center = self.center;
        self.alertview.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.alertview];
        [self createYTStsrAlertView];
    }
    return self;
}

-(void)createYTStsrAlertView{
    //评价
    self.evaluate_label = [UILabel new];
    [self.alertview addSubview:self.evaluate_label];
    [self.evaluate_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kFit(16));
        make.centerX.equalTo(self.mas_centerX);
    }];
    self.evaluate_label.text = @"评价";
    self.evaluate_label.textColor = main_color;
    self.evaluate_label.font = [UIFont systemFontOfSize:kFit(16)];
    
    //服务态度
    self.service_attitude_label = [UILabel new];
    [self.alertview addSubview:self.service_attitude_label];
    [self.service_attitude_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kFit(30));
        make.top.equalTo(self.evaluate_label.mas_bottom).offset(kFit(20));
    }];
    self.service_attitude_label.text = @"服务态度";
    self.service_attitude_label.textColor = main_font_deep_color;
    self.service_attitude_label.font = [UIFont systemFontOfSize:kFit(14)];
    //服务态度🌟
    JWStarView * service_attitude_starView = [[JWStarView alloc]initWithFrame:CGRectMake(kFit(95), kFit(55), kFit(130), kFit(15)) finish:^(CGFloat currentScore) {
        NSLog(@"current-----%f",currentScore);
    }];
    service_attitude_starView.currentScore = 5.0;
    [self.alertview addSubview:service_attitude_starView];
    
    //服务态度评价
    self.service_attitude_evaluate_label = [UILabel new];
    [self.alertview addSubview:self.service_attitude_evaluate_label];
    [self.service_attitude_evaluate_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-kFit(30));
        make.top.equalTo(self.evaluate_label.mas_bottom).offset(kFit(20));
    }];
    self.service_attitude_evaluate_label.text = @"好评";
    self.service_attitude_evaluate_label.textColor = main_color;
    self.service_attitude_evaluate_label.font = [UIFont systemFontOfSize:kFit(14)];
    
    //解决速度
    self.solve_speed_label = [UILabel new];
    [self.alertview addSubview:self.solve_speed_label];
    [self.solve_speed_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kFit(30));
        make.top.equalTo(self.service_attitude_label.mas_bottom).offset(kFit(20));
    }];
    self.solve_speed_label.text = @"解决速度";
    self.solve_speed_label.textColor = main_font_deep_color;
    self.solve_speed_label.font = [UIFont systemFontOfSize:kFit(14)];
    //解决速度🌟
    JWStarView * solve_speed_starView = [[JWStarView alloc]initWithFrame:CGRectMake(kFit(95), kFit(90), kFit(130), kFit(15)) finish:^(CGFloat currentScore) {
        NSLog(@"current-----%f",currentScore);
    }];
    solve_speed_starView.currentScore = 5.0;
    [self.alertview addSubview:solve_speed_starView];
    
    //解决速度评价
    self.solve_speed_evaluate_label = [UILabel new];
    [self.alertview addSubview:self.solve_speed_evaluate_label];
    [self.solve_speed_evaluate_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-kFit(30));
        make.top.equalTo(self.service_attitude_label.mas_bottom).offset(kFit(20));
    }];
    self.solve_speed_evaluate_label.text = @"好评";
    self.solve_speed_evaluate_label.textColor = main_color;
    self.solve_speed_evaluate_label.font = [UIFont systemFontOfSize:kFit(14)];
    
    //满意度
    self.satisfaction_label = [UILabel new];
    [self.alertview addSubview:self.satisfaction_label];
    [self.satisfaction_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kFit(30));
        make.top.equalTo(self.solve_speed_label.mas_bottom).offset(kFit(20));
    }];
    self.satisfaction_label.text = @"满意度";
    self.satisfaction_label.textColor = main_font_deep_color;
    self.satisfaction_label.font = [UIFont systemFontOfSize:kFit(14)];
    //满意度🌟
    JWStarView * satisfaction_starView = [[JWStarView alloc]initWithFrame:CGRectMake(kFit(95), kFit(130), kFit(130), kFit(15)) finish:^(CGFloat currentScore) {
        NSLog(@"current-----%f",currentScore);
    }];
    satisfaction_starView.currentScore = 5.0;
    [self.alertview addSubview:satisfaction_starView];
    
    //满意度评价
    self.satisfaction_evaluate_label = [UILabel new];
    [self.alertview addSubview:self.satisfaction_evaluate_label];
    [self.satisfaction_evaluate_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-kFit(30));
        make.top.equalTo(self.solve_speed_label.mas_bottom).offset(kFit(20));
    }];
    self.satisfaction_evaluate_label.text = @"好评";
    self.satisfaction_evaluate_label.textColor = main_color;
    self.satisfaction_evaluate_label.font = [UIFont systemFontOfSize:kFit(14)];
    
    //输入评价内容
    self.evaluate_content_textView = [UITextView new];
    [self.alertview addSubview:self.evaluate_content_textView];
    [self.evaluate_content_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.satisfaction_label.mas_bottom).offset(kFit(40));
        make.left.offset(kFit(30));
        make.right.offset(-kFit(30));
        make.height.offset(kFit(50));
    }];
    self.evaluate_content_textView.delegate = self;
    self.evaluate_content_textView.text = @"说说您想说的～";
    self.evaluate_content_textView.textColor = UIColorFromR_G_B(204, 204, 204, 1);
    self.evaluate_content_textView.font = [UIFont systemFontOfSize:kFit(10)];
    
    //500字内
    self.max_textCont_label = [UILabel new];
    [self.alertview addSubview:self.max_textCont_label];
    [self.max_textCont_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-kFit(15));
        make.bottom.offset(-kFit(43));
    }];
    self.max_textCont_label.text = @"500字内";
    self.max_textCont_label.textColor = main_font_light_color;
    self.max_textCont_label.font = [UIFont systemFontOfSize:kFit(10)];
    
    //取消
    self.evaluate_cancel_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alertview addSubview:self.evaluate_cancel_button];
    [self.evaluate_cancel_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.offset(0);
        make.height.offset(kFit(33));
        make.width.offset(kFit(145));
    }];
    self.evaluate_cancel_button.backgroundColor = UIColorFromR_G_B(238, 238, 238, 1);
    [self.evaluate_cancel_button setTitle:@"取消" forState:UIControlStateNormal];
    [self.evaluate_cancel_button setTitleColor:UIColorFromR_G_B(84, 84, 84, 1) forState:UIControlStateNormal];
    self.evaluate_cancel_button.titleLabel.font = [UIFont systemFontOfSize:kFit(14)];
    [self.evaluate_cancel_button addTarget:self action:@selector(evaluate_cancel_buttonAction) forControlEvents:UIControlEventTouchUpInside];
    //确定
    self.evaluate_makeSure_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alertview addSubview:self.evaluate_makeSure_button];
    [self.evaluate_makeSure_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.offset(0);
        make.height.offset(kFit(33));
        make.width.offset(kFit(145));
    }];
    self.evaluate_makeSure_button.backgroundColor = main_color;
    [self.evaluate_makeSure_button setTitle:@"评价" forState:UIControlStateNormal];
    [self.evaluate_makeSure_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.evaluate_makeSure_button.titleLabel.font = [UIFont systemFontOfSize:kFit(14)];
    [self.evaluate_makeSure_button addTarget:self action:@selector(evaluate_makeSure_buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark -
#pragma mark -------->取消Action
-(void)evaluate_cancel_buttonAction{
    NSLog(@"取消了----view");
    if (self.ytAlertViewCloseBlock) {
        self.ytAlertViewCloseBlock();
        [self dismissAlertView];
    }
}

#pragma mark -
#pragma mark -------->评价Action
-(void)evaluate_makeSure_buttonAction{
    NSLog(@"评价了-----view");
    if (self.ytAlertViewMakeSureBlock) {
        self.ytAlertViewMakeSureBlock(self.service_attitude_starNum,
                                      self.service_attitude_evaluate_str,
                                      self.solve_speed_starNum,
                                      self.solve_speed_evaluate_str,
                                      self.satisfaction_starNum,
                                      self.satisfaction_evaluate_str,
                                      self.evaluate_content_str);
        [self dismissAlertView];
    }
}


#pragma mark -
#pragma mark -------->textViewDidBeginEditing
- (void)textViewDidBeginEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.3 // 动画时长
                          delay:0.0 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                     animations:^{
                         self.alertview.frame = CGRectMake(Screen_Width/2 - kFit(290)/2, ([NSStringFromCGSize([UIScreen mainScreen].bounds.size) isEqualToString:@"{375, 812}"] ? 44 : 20), kFit(290), kFit(300));
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                     }];
    if([textView.text isEqualToString:@"说说您想说的～"]){
        textView.text=@"";
        textView.textColor = main_font_deep_color;
        
    }
}

#pragma mark - textViewDidEndEditing
- (void)textViewDidEndEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.3 // 动画时长
                          delay:0.0 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                     animations:^{
                         self.alertview.frame = CGRectMake(Screen_Width/2 - kFit(290)/2, kFit(130) + ([NSStringFromCGSize([UIScreen mainScreen].bounds.size) isEqualToString:@"{375, 812}"] ? 44 : 20), kFit(290), kFit(300));
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                     }];
    
    if(textView.text.length < 1){
        textView.text = @"说说您想说的～";
        textView.textColor = UIColorFromR_G_B(204, 204, 204, 1);
    }else{
        textView.textColor = [UIColor blackColor];
    }
}

-(void)textViewDidChange:(UITextView *)textView{
    
    NSString *lang = textView.textInputMode.primaryLanguage;//键盘输入模式
    static NSInteger length = 0;
    if ([lang isEqualToString:@"zh-Hans"]){
        UITextRange *selectedRange = [textView markedTextRange];
        if (!selectedRange) {//没有有高亮
            length = textView.text.length;
        }else{
            
        }
    }else{
        length = textView.text.length;
    }
    
    NSLog(@"length------->%ld",(long)length);
    
    if (length > 500 ) {
        //        self.iWantPraiseViewTextView.text =  [self.iWantPraiseViewTextView.text substringToIndex:200];
    }
}

#pragma mark -
#pragma mark -------->评价set方法
-(void)setYtAlertViewMakeSureBlock:(void (^)(NSInteger, NSString *, NSInteger, NSString *, NSInteger, NSString *, NSString *))ytAlertViewMakeSureBlock{
    _ytAlertViewMakeSureBlock = ytAlertViewMakeSureBlock;
}

#pragma mark -
#pragma mark -------->取消set方法
-(void)setYtAlertViewCloseBlock:(void (^)(void))ytAlertViewCloseBlock{
    _ytAlertViewCloseBlock = ytAlertViewCloseBlock;
}

-(UIView *)alertview
{
    if (_alertview == nil) {
        _alertview = [[UIView alloc] init];
        _alertview.backgroundColor = [UIColor whiteColor];
        _alertview.layer.cornerRadius = 10.0;
        _alertview.layer.masksToBounds = YES;
        _alertview.userInteractionEnabled = YES;
    }
    return _alertview;
}

-(void)show
{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    
    self.alertview.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.alertview.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = UIColorFromR_G_B(1, 1, 1, 0.3f);
        self.alertview.transform = transform;
        self.alertview.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)dismissAlertView{
    [UIView animateWithDuration:0.3 animations:^{
        [self removeFromSuperview];
    }];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
