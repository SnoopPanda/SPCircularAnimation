//
//  UIView+CircularAnimation.h
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/2.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CircularAnimation)

- (void)animateCircularWithDuration:(NSTimeInterval)duration center:(CGPoint)center revert:(BOOL)revert animations:(void (^)())animations;

- (void)animateCircularWithDuration:(NSTimeInterval)duration center:(CGPoint)center revert:(BOOL)revert animations:(void(^)())animations completion:(void(^)(BOOL finished)) completion;

@end
