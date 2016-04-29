//
//  ViewDemo2.m
//  GaugeDemo
//
//  Created by lvyanlong on 16/4/29.
//  Copyright © 2016年 lvyanlong. All rights reserved.
//

#import "ViewDemo2.h"
#import "ProgressView.h"
#import "UIView+ViewExtention.h"
#import "Common.h"

@interface ViewDemo2 ()
{
    ProgressView *progressView;
}

@end

@implementation ViewDemo2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    [self buildUI];
}

- (void)buildUI{
    
    progressView = [[ProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    progressView.backgroundColor = [UIColor colorWithRed:0.09 green:0.58 blue:0.84 alpha:1.0];
    [self.view addSubview:progressView];
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(30, progressView.bottom + 20, SCREEN_WIDTH , 20);
    title.text = @"测试文本，随便输入";
    title.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:title];
    
    UIView *seperateLine = [[UIView alloc] init];
    seperateLine.frame = CGRectMake(30, title.bottom + 20, SCREEN_WIDTH, 1);
    seperateLine.backgroundColor = [UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.0];
    [self.view addSubview:seperateLine];
    
    UILabel *content = [[UILabel alloc] init];
    content.frame = CGRectMake(30, seperateLine.bottom + 20, SCREEN_WIDTH , 20);
    content.text = @"测试文本，你想干啥";
    content.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:content];

    
    UIBezierPath *pathBack = [[UIBezierPath alloc] init];
    [pathBack moveToPoint:CGPointMake(30, content.bottom + 30)];
    [pathBack addLineToPoint:CGPointMake(200, content.bottom + 30)];
    
    CAShapeLayer *layerBack = [CAShapeLayer layer];
    layerBack.fillColor = [UIColor clearColor].CGColor;
    layerBack.strokeColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.0].CGColor;
    layerBack.lineWidth = 2;
    layerBack.lineCap = kCALineCapRound;
    layerBack.path = [pathBack CGPath];
    [self.view.layer addSublayer:layerBack];
    
    
    UIBezierPath *pathFront = [[UIBezierPath alloc] init];
    [pathFront moveToPoint:CGPointMake(30, content.bottom + 30)];
    [pathFront addLineToPoint:CGPointMake(100, content.bottom + 30)];
    
    CAShapeLayer *layerFront = [CAShapeLayer layer];
    layerFront.fillColor = [UIColor clearColor].CGColor;
    layerFront.strokeColor = [UIColor grayColor].CGColor;
    layerFront.lineWidth = 5;
    layerFront.lineCap = kCALineCapRound;
    layerFront.path = [pathFront CGPath];
    [self.view.layer addSublayer:layerFront];
    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClose.frame = CGRectMake(SCREEN_WIDTH - 30, 400, 30, 30);
    btnClose.backgroundColor = [UIColor purpleColor];
    btnClose.titleLabel.font =  [UIFont systemFontOfSize:7];
    [btnClose setTitle:@"关闭" forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];
    
}

- (void)btnClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
