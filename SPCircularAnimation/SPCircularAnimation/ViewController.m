//
//  ViewController.m
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/12.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CircularAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, assign) BOOL revert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [self randomColor];
    self.revert = NO;
    
    self.startBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [self.startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.startBtn.backgroundColor = [UIColor whiteColor];
    self.startBtn.layer.cornerRadius = 50;
    [self.startBtn clipsToBounds];
    self.startBtn.center = self.view.center;
    [self.view addSubview:self.startBtn];
    
    [self.startBtn addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
}

- (void)startAnimation {
    
    self.revert = !self.revert;
    [self.view animateCircularWithDuration:0.5 center:self.view.center revert:self.revert animations:^{
        self.view.backgroundColor = [self randomColor];
    }];
}

- (UIColor *)randomColor {
    UIColor *color = [[UIColor alloc] initWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    return color;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
