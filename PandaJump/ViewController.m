//
//  ViewController.m
//  PandaJump
//
//  Created by sensology on 2016/11/8.
//  Copyright © 2016年 智觅智能. All rights reserved.
//

#import "ViewController.h"
#import "JumpBallView.h"

@interface ViewController (){
    JumpBallView *ballView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ballView = [[JumpBallView alloc]initWithFrame:CGRectMake(0, 60, 200, 200)];
    ballView.center = CGPointMake(self.view.center.x, 200) ;
    [ballView initFaceView];
    [self.view addSubview:ballView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
