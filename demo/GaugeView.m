//
//  GaugeView.m
//  demo
//
//  Created by lvyanlong on 16/4/28.
//  Copyright © 2016年 lvyanlong. All rights reserved.
//

#import "GaugeView.h"
#import "Common.h"
#import "UIView+ViewExtention.h"
#define DEGREES_TO_RADIANS(degrees) (degrees) / 180.0 * M_PI

@implementation GaugeView
{
    CAShapeLayer *layer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
   
    if (self){
        [self initView];
    }
    
    return self;
}

- (CGPoint) calcCircleCoordinateWithCenter:(CGPoint) center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius{
    CGFloat x2 = radius*cosf(angle);
    CGFloat y2 = radius*sinf(angle);
    return CGPointMake(center.x+x2, center.y-y2);
}

- (void)initView{
    [self drawGauge];
    [self drawTap];
    [self drawText];
    
}

- (void)drawText{
    UILabel *correctText = [[UILabel alloc] init];
    correctText.frame = CGRectMake(SCREEN_WIDTH/2 - 50/2, 120, 50, 20);
    correctText.backgroundColor = self.backgroundColor;
    correctText.text = @"正确率";
    correctText.textAlignment = NSTextAlignmentCenter;
    correctText.textColor = [UIColor colorWithRed:0.54 green:0.78 blue:0.91 alpha:1.0];
    correctText.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    [self addSubview:correctText];
    
    UILabel *correctNumber = [[UILabel alloc] init];
    correctNumber.frame = CGRectMake(SCREEN_WIDTH/2 - 70/2, 140, 70, 70);
    correctNumber.backgroundColor = [UIColor colorWithRed:0.09 green:0.58 blue:0.84 alpha:1.0];;
    correctNumber.text = @"90%";
    correctNumber.textAlignment = NSTextAlignmentCenter;
    correctNumber.textColor = [UIColor whiteColor];
    correctNumber.font = [UIFont fontWithName:@"Helvetica-Bold" size:30];
    [self addSubview:correctNumber];
}


- (void)drawTap{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 64, 10, 10)];
    view1.backgroundColor = [UIColor colorWithRed:0.99 green:0.64 blue:0.64 alpha:1.0];
    view1.layer.cornerRadius = 5;
    view1.layer.masksToBounds = YES;
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(view1.right + 2, 64, 10, 10)];
    view2.backgroundColor = [UIColor colorWithRed:1.00 green:0.91 blue:0.51 alpha:1.0];
    view2.layer.cornerRadius = 5;
    view2.layer.masksToBounds = YES;
    [self addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(view2.right + 2, 64, 10, 10)];
    view3.backgroundColor = [UIColor colorWithRed:0.81 green:0.99 blue:0.46 alpha:1.0];
    view3.layer.cornerRadius = 5;
    view3.layer.masksToBounds = YES;
    [self addSubview:view3];
}

- (void)drawGauge{
    
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:M_PI* (-195)/180  endAngle:M_PI * (15)/180 clockwise:YES];
    
    //    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2) radius:(frame.size.width-PROGRESS_LINE_WIDTH)/2-5 startAngle:degressToRadius(-240) endAngle:degressToRadius(60) clockwise:YES];
    layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = RGBColor(185,243,110).CGColor;
    layer.lineCap = kCALineCapRound;
    layer.lineWidth = 5;
    layer.path = [path CGPath];
    
    [self.layer addSublayer:layer];
    
    
    for (int i = 0; i < 51; i++) {
        
        CGFloat perAngle = 210.f/50.f;
        CGFloat startAngle = M_PI * (-195 + i * perAngle)/180;
        CGFloat textAngle = M_PI * (195 - i * perAngle)/180;
        CGFloat endAngle = startAngle + M_PI * (perAngle/5)/180;
        
        UIBezierPath *perPath = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        CAShapeLayer *perLayer = [CAShapeLayer layer];
        perLayer.fillColor = [UIColor clearColor].CGColor;
        perLayer.lineCap = kCALineCapButt;
        if (i % 5 == 0) {
            perLayer.strokeColor = [UIColor colorWithRed:0.62 green:0.84 blue:0.93 alpha:1.0].CGColor;
            perLayer.lineWidth = 10;
            
            CGPoint point = [self calcCircleCoordinateWithCenter:center andWithAngle:textAngle andWithRadius:125];
            NSString *valueString = [NSString stringWithFormat:@"%d",i * 2];
            
            UIFont* font = [UIFont fontWithName:@"Helvetica-Bold" size:7];
            UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(point.x - 5, point.y - 5, 12, 12)];
            text.text = valueString;
            text.font = font;
            text.textColor = [UIColor colorWithRed:0.54 green:0.78 blue:0.91 alpha:1.0];
            text.textAlignment = NSTextAlignmentCenter;
            [self addSubview:text];
            
        }
        else
        {
            perLayer.strokeColor = [UIColor colorWithRed:0.22 green:0.66 blue:0.87 alpha:1.0].CGColor;
            perLayer.lineWidth = 5;
        }
        perLayer.path = [perPath CGPath];
        [self.layer addSublayer:perLayer];
        
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect{
//
//}

@end
