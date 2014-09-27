//
//  FreefallAnimationViewController.m
//  FreefallAnimation
//
//  Created by fangchao on 14-9-27.
//  Copyright (c) 2014年 hallwaysunshine. All rights reserved.
//

#import "FreefallAnimationViewController.h"

#define degreesToRadians(x)(M_PI*x/180.0)

@interface FreefallAnimationViewController ()

@end

@implementation FreefallAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  @brief  向上移动
 *
 *  @param  view 需要移动的视图
 *  @param  duration    调用时间
 *  @param  wait    是否等待（设置为YES，等待动画结束）
 *  @param  length  等待时间
 *
 *  @return
 */
+(void)moveUp:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait andLength:(float)length
{
    __block BOOL done = wait;
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y - length);
    }completion:^(BOOL finished) {
        done = NO;
    }];
    
    while (done == YES) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    }
}

/**
 *  @brief  向下移动
 *
 *  @param  view 需要移动的视图
 *  @param  duration    调用时间
 *  @param  wait    是否等待（设置为YES，等待动画结束）
 *  @param  length  等待时间
 *
 *  @return
 */
+(void)moveDown:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait andLength:(float)length
{
    __block BOOL done = wait;
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y + length);
    }completion:^(BOOL finished) {
        done = NO;
    }];
    
    while (done == YES) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    }
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
