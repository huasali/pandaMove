//
//  PandaFaceView.m
//  PandaJump
//
//  Created by sensology on 2016/11/8.
//  Copyright © 2016年 智觅智能. All rights reserved.
//

#import "PandaFaceView.h"

@implementation PandaFaceView



- (void)drawRect:(CGRect)rect {
    
    self.layer.backgroundColor = [[UIColor clearColor]CGColor] ;
    
    CGFloat weight = self.frame.size.width;
    
    //CGFloat height = self.frame.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor blackColor] setStroke];
    
    CGContextSetLineWidth(context, 1.0);
    
    CGContextAddArc(context,self.center.x, self.center.y, weight*3/8.0f, 0, 2*M_PI, 0);//脸
    
    [[UIColor whiteColor] setFill];
    
    CGContextFillPath(context);
    
    CGContextAddArc(context,self.center.x, self.center.y, weight*3/8.0f + 1.0, 0, 2*M_PI, 0);//脸轮廓
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSetLineWidth(context, 0.2);
    
    [self addMaoWithCon:context andCenter:CGPointMake(self.center.x, self.center.y) andR:weight*3/8.0f andCount:90 andLength:weight/60.0];
    
    [[UIColor blackColor] setFill];
    
    CGContextAddArc(context,self.center.x/2.0  , self.center.y*3/5.0, weight*3/24.0f, 0, 2*M_PI, 0);//耳朵
    
    CGContextAddArc(context,self.center.x*3/2.0, self.center.y*3/5.0, weight*3/24.0f, 0, 2*M_PI, 0);
    
    CGContextFillPath(context);
    
    [self addMaoWithCon:context andCenter:CGPointMake(self.center.x/2.0  , self.center.y*3/5.0) andR:weight*3/24.0f andCount:45 andLength:weight/160.0];
    
    [self addMaoWithCon:context andCenter:CGPointMake(self.center.x*3/2.0, self.center.y*3/5.0) andR:weight*3/24.0f andCount:45 andLength:weight/160.0];
    
    [[UIColor blackColor] setFill];
    
    CGContextAddArc(context,self.center.x*3/4.0  , self.center.y, weight/12.0f, 0, 2*M_PI, 0);//眼睛外侧
    
    CGContextAddArc(context,self.center.x*5/4.0, self.center.y, weight/12.0f, 0, 2*M_PI, 0);
    
    CGContextFillPath(context);
    
    [[UIColor whiteColor] setFill];
    
    CGContextAddArc(context,self.center.x*3/4.0 + weight/40.0f, self.center.y, weight/48.0f, 0, 2*M_PI, 0);//眼睛
    
    CGContextAddArc(context,self.center.x*5/4.0 - weight/40.0f, self.center.y, weight/48.0f, 0, 2*M_PI, 0);
    
    CGContextFillPath(context);
    
   // CGContextClosePath(context);
    
}




- (void)addMaoWithCon:(CGContextRef)context andCenter:(CGPoint)point andR:(CGFloat)r andCount:(int)count andLength:(CGFloat)length{
    
    for (int i = 0; i < count; i++) {
        
        CGContextMoveToPoint(context, point.x + r*cosf(i*2*M_PI/count), point.y + r*sinf(i*2*M_PI/count));
        
        CGContextAddQuadCurveToPoint(context, point.x + (r + length/2.0)*cosf((i - 3)*2*M_PI/count), point.y + (r + length/2.0)*sinf((i - 3)*2*M_PI/count), point.x + (r + length)*cosf(i*2*M_PI/count), point.y + (r + length)*sinf(i*2*M_PI/count));
        
        CGContextDrawPath(context, kCGPathStroke);
        
    }
}




@end
