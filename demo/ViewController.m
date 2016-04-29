//
//  ViewController.m
//  demo
//
//  Created by lvyanlong on 16/4/27.
//  Copyright © 2016年 lvyanlong. All rights reserved.
//

#import "ViewController.h"
#import "ViewDemo1ViewController.h"
#import "ViewDemo2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnViewDemo2;
@property (weak, nonatomic) IBOutlet UIButton *btnViewDemo1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _btnViewDemo1.backgroundColor = [UIColor colorWithRed:0.81 green:0.99 blue:0.46 alpha:1.0];
    _btnViewDemo2.backgroundColor = [UIColor colorWithRed:0.99 green:0.64 blue:0.64 alpha:1.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnView1Click:(id)sender {
    
    ViewDemo1ViewController *demoView1 = [[ViewDemo1ViewController alloc] init];
    
    [self presentViewController:demoView1 animated:YES completion:^{
        
    }];
    
    
}


- (IBAction)btnView2Click:(id)sender {
    ViewDemo2 *demoView2 = [[ViewDemo2 alloc] init];
    [self presentViewController:demoView2 animated:YES completion:^{
        
    }];
   
}

@end
