//
//  Timer.h
//  CountDownTimer
//
//  Created by WangQiao on 17/3/1.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Timer;

@protocol TimerDelegate <NSObject>

- (void)timerFinished:(Timer *)timer;

@end

@interface Timer : UIView

@property (nonatomic) id <TimerDelegate> delegate;

@property (nonatomic)NSInteger sceonds;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) NSTimer *timer;

- (void)timerStart;

@end
