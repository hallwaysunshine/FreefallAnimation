//
//  FreefallAnimationViewController.h
//  FreefallAnimation
//
//  Created by fangchao on 14-9-27.
//  Copyright (c) 2014年 hallwaysunshine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreefallAnimationViewController : UIViewController

/**
 *  @brief  向上移动
 *
 *  @param  view 需要移动的视图
 *  @param  duration    调用时间
 *  @param  wait    是否等待
 *  @param  length  等待时间
 *
 *  @return
 */
+(void)moveUp:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait andLength:(float)length;

/**
 *  @brief  向下移动
 *
 *  @param  view 需要移动的视图
 *  @param  duration    调用时间
 *  @param  wait    是否等待
 *  @param  length  等待时间
 *
 *  @return
 */
+(void)moveDown:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait andLength:(float)length;

@end
