//
//  JumpBallView.m
//  PalyBallDemo
//
//  Created by taojin on 16/5/10.
//  Copyright © 2016年 jianhua. All rights reserved.
//

#import "JumpBallView.h"
#import "PandaFaceView.h"

@interface JumpBallView (){
    float count;
    NSTimer *myTime;
    float heightCount;
    BOOL isDrop;
    PandaFaceView *faceView;
    CGPoint currentPosition;
    BOOL isTap;
}


@end

@implementation JumpBallView

- (void)awakeFromNib{
    [super awakeFromNib];

}

- (void)initFaceView{
    self.layer.anchorPoint = CGPointMake(0.5, 1.0);
    faceView = [[PandaFaceView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:faceView];
    faceView.backgroundColor = [UIColor clearColor];
    [faceView setNeedsDisplay];
    [self startJump];
    count = 0;
    isDrop = YES;
    heightCount = 300;
}

- (void)startJump{
    
    if (!myTime) {
        myTime = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(changCount:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:myTime forMode:NSRunLoopCommonModes];
    }
}

- (void)changCount:(NSTimer *)t{
    if (isDrop) {
        count+=0.2;
    }
    else{
        count-=0.2;
    }
    [self jumpingWithCount:count];
}

- (void)stopJump{
    if (myTime) {
        [myTime invalidate];
        myTime = nil;
    }
}


- (void)jumpingWithCount:(float)tempCount{
    float moveLenth = 0.5*tempCount*tempCount*9.8;
    if (moveLenth <= heightCount) {
        self.transform = CGAffineTransformMake(1, 0, 0, 1, 0, moveLenth);
    }
    else if (moveLenth > heightCount&&moveLenth < 2*heightCount) {
        float tempCount = (moveLenth-heightCount)/ heightCount;
        tempCount = 1 - tempCount;
        tempCount = tempCount > 0.5?tempCount:0.5;
        CGAffineTransform affine = CGAffineTransformMake(1, 0, 0, tempCount, 0, heightCount);
        self.transform = affine;
    }
    else if (moveLenth >= 2*heightCount) {
        isDrop = !isDrop;
        NSLog(@" 变相 %@",self);
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    isTap = NO;
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    CGFloat positX = currentPosition.x - position.x;
    CGFloat positY = currentPosition.y - position.y;
    
    self.center = CGPointMake(self.center.x - positX, self.center.y - positY);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self stopJump];
    isTap = YES;
    UITouch *touch = [touches anyObject];
    currentPosition = [touch locationInView:self];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self startJump];
    if (isTap) {

    }
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}



- (void)removeFromSuperview{
    [super removeFromSuperview];
    [self stopJump];
}

- (void)dealloc{
    [self stopJump];
}

@end
