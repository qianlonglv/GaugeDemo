//
//  ProgressView.m
//  GaugeDemo
//
//  Created by lvyanlong on 16/4/29.
//  Copyright © 2016年 lvyanlong. All rights reserved.
//

#import "ProgressView.h"
#import "Common.h"

@implementation ProgressView{
    CAShapeLayer *layerBack;
    CAShapeLayer *layerFront;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self){
        [self initView];
    }
    
    return self;
}

- (void)initView{
    [self drawProgress];
    [self buildText];
}

- (void)buildText{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(SCREEN_WIDTH/2 - 150/2, 300, 150, 20);
    label.textColor = [UIColor whiteColor];
    label.text = @"测试文本，任你输入";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [self addSubview:label];
}

- (void)drawProgress{
   CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    UIBezierPath *pathBack= [UIBezierPath bezierPathWithArcCenter:center radius:70 startAngle:M_PI* (-360)/180  endAngle:M_PI * (0)/180 clockwise:YES];
    
    layerBack = [CAShapeLayer layer];
    layerBack.frame = self.bounds;
    layerBack.fillColor = [UIColor clearColor].CGColor;
    layerBack.strokeColor = [UIColor colorWithRed:0.32 green:0.71 blue:0.89 alpha:1.0].CGColor;
    layerBack.lineCap = kCALineCapRound;
    layerBack.lineWidth = 10;
    layerBack.path = [pathBack CGPath];
    
    [self.layer addSublayer:layerBack];
    
    
    UIBezierPath *pathFront = [UIBezierPath bezierPathWithArcCenter:center radius:68.5 startAngle:M_PI * (-90)/180 endAngle:M_PI * (165)/180 clockwise:YES];
    
    layerFront = [CAShapeLayer layer];
    layerFront.frame = self.bounds;
    layerFront.fillColor = [UIColor clearColor].CGColor;
    layerFront.strokeColor = [UIColor colorWithRed:1.00 green:0.91 blue:0.51 alpha:1.0].CGColor;
    layerFront.lineCap = kCALineCapButt;
    layerFront.lineWidth = 20;
    layerFront.path = [pathFront CGPath];
    [self.layer addSublayer:layerFront];

}

@end
