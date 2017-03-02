//
//  ViewController.m
//  CountDownTimer
//
//  Created by WangQiao on 17/3/1.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController.h"
#import "Timer.h"

@interface ViewController ()<TimerDelegate>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) Timer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    // 倒计时界面
    self.timer          = [[Timer alloc] initWithFrame:CGRectMake(10, 100, 200, 30)];
    self.timer.delegate = self;
    self.timer.sceonds  = 5;
    self.timer.layer.borderWidth  = 1;
    self.timer.layer.cornerRadius = 5;
    self.timer.layer.borderColor  = [UIColor orangeColor].CGColor;
    self.timer.label.font         = [UIFont systemFontOfSize:14];
    self.timer.label.textColor    = [UIColor orangeColor];
    [self.view addSubview:self.timer];
    
    self.button                   = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100, 40)];
    self.button.layer.borderWidth = 1.0f;
    self.button.layer.borderColor = [UIColor blackColor].CGColor;
    [self.button setTitle:@"点击" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonEvent {
 
    // 启动倒计时的方法
    [self.timer timerStart];
    self.button.enabled = NO;
    self.button.layer.borderColor = [UIColor grayColor].CGColor;
}

- (void)timerFinished:(Timer *)timer {

    self.button.enabled = YES;
    self.button.layer.borderColor = [UIColor blackColor].CGColor;
}

@end
