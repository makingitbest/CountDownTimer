//
//  Timer.m
//  CountDownTimer
//
//  Created by WangQiao on 17/3/1.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "Timer.h"

@interface Timer ()

@property (nonatomic) NSInteger  cutDownNum;

@end

@implementation Timer

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.label               = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.text          = @"准备倒计时";
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
    }
    return self;
}

- (void)timerStart {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(cutDownEvent)
                                                userInfo:nil
                                                 repeats:YES];
    self.cutDownNum = self.sceonds;
}

- (void)cutDownEvent {
    
    NSInteger i = self.cutDownNum-- ;
    
    self.label.text = [NSString stringWithFormat:@"开始倒计时(%lds)",i];
    
    if (i <= 0) {
        
        [self.delegate respondsToSelector:@selector(timerFinished:)];
        [self.timer invalidate];
        
        [self performSelector:@selector(reset) withObject:nil afterDelay:1];
    }
}

- (void)reset {

    self.label.text = @"准备倒计时";
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(timerFinished:)]) {
        
        [self.delegate timerFinished:self];
    }
}

@end
