//
//  View1.m
//  demo
//
//  Created by lvyanlong on 16/4/27.
//  Copyright © 2016年 lvyanlong. All rights reserved.
//

#import "ViewDemo1ViewController.h"
#import "GaugeView.h"
#import "Common.h"
#import "UIView+ViewExtention.h"



@interface ViewDemo1ViewController ()
{
    GaugeView *gaugeView;
}

@end

@implementation ViewDemo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    UIView *viewtest = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, 50, 50)];
    //    viewtest.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:viewtest];
    
    gaugeView = [[GaugeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    gaugeView.backgroundColor = [UIColor colorWithRed:0.09 green:0.58 blue:0.84 alpha:1.0];
    [self.view addSubview:gaugeView];
    
    [self buildButton];
    
}

- (void)buildButton{
    CGFloat buttonWidth = (SCREEN_WIDTH - 15 * 2 - 10 *3)/4;
    for (int i = 0; i < 2; i++) {
        for (int j= 0; j < 4; j++) {
            CGRect frame = CGRectMake(15 + j * (buttonWidth + 10), gaugeView.bottom + 20 + i * (50 + 10), buttonWidth, 50);
            UIColor *btnColor;
            switch (j) {
                case 0:
                    btnColor = [UIColor colorWithRed:0.60 green:0.80 blue:0.38 alpha:1.0];
                    break;
                case 1:
                    btnColor = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0];
                    break;
                case 2:
                    btnColor = [UIColor colorWithRed:0.60 green:0.80 blue:0.38 alpha:1.0];
                    break;
                case 3:
                    btnColor = [UIColor colorWithRed:0.98 green:0.54 blue:0.46 alpha:1.0];
                    break;
                    
                default:
                    break;
            }
            [self createButton:frame color:btnColor];
            
        }
        
        
    }
    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClose.frame = CGRectMake(SCREEN_WIDTH - 30, 400, 30, 30);
    btnClose.backgroundColor = [UIColor purpleColor];
    [btnClose setTitle:@"关闭" forState:UIControlStateNormal];
    btnClose.titleLabel.font =  [UIFont systemFontOfSize:7];
    btnClose.titleLabel.textColor = [UIColor whiteColor];
    [btnClose addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];
    
}

- (void)btnClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIButton *)createButton:(CGRect )frame color:(UIColor *)color{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.backgroundColor = color;
    btn.titleLabel.text = @"";
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
    
    return btn;
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
