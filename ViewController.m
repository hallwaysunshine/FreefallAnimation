//
//  ViewController.m
//  FreefallAnimation
//
//  Created by fangchao on 14-9-27.
//  Copyright (c) 2014年 hallwaysunshine. All rights reserved.
//

#import "ViewController.h"

#import "FreefallAnimationViewController.h"

@interface ViewController ()

/**
 *  @brief  基础界面
 */
@property (nonatomic,strong)UIView *baseView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    /**
     *  @brief  构建基础界面并添加指导界面出现手势
     */
    self.baseView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.baseView];
    
    UISwipeGestureRecognizer *guideViewSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handle:)];
    [guideViewSwipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.baseView setUserInteractionEnabled:YES];
    [self.baseView addGestureRecognizer:guideViewSwipeGestureRecognizer];

    /**
     *  @brief  构建指导界面并添加消失指导界面手势
     */
    self.guideView = [[UIView alloc]initWithFrame:self.view.bounds];
    [_guideView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:_guideView];
    
    UISwipeGestureRecognizer *guideSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(toUpside)];
    [guideSwipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.guideView setUserInteractionEnabled:YES];
    [self.guideView addGestureRecognizer:guideSwipeGestureRecognizer];
}

/**
 *  @brief  指导界面出现方法
 */
-(void)handle:(UISwipeGestureRecognizer *)recognizer
{
    [FreefallAnimationViewController moveDown:self.guideView andAnimationDuration:0.3 andWait:YES andLength:568.0];
    [FreefallAnimationViewController moveUp:self.guideView andAnimationDuration:0.2 andWait:YES andLength:80.0];
    [FreefallAnimationViewController moveDown:self.guideView andAnimationDuration:0.1 andWait:YES andLength:80.0];
    [FreefallAnimationViewController moveUp:self.guideView andAnimationDuration:0.1 andWait:YES andLength:12.0];
    [FreefallAnimationViewController moveDown:self.guideView andAnimationDuration:0.1 andWait:YES andLength:12.0];
}

/**
 *  @brief  指导界面消失方法
 */
-(void)toUpside
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.guideView setFrame:CGRectMake(self.view.bounds.origin.x,
                                            -self.view.bounds.size.height,
                                            self.view.bounds.size.width,
                                            self.view.bounds.size.height)];
    } completion:^(BOOL finished) {
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
