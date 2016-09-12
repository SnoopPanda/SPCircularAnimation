//
//  UIView+CircularAnimation.m
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/2.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import "UIView+CircularAnimation.h"
#import "SPCircularRevealAnimator.h"

@implementation UIView (CircularAnimation)

- (void)animateCircularWithDuration:(NSTimeInterval)duration center:(CGPoint)center revert:(BOOL)revert animations:(void (^)())animations {
    
    [self animateCircularWithDuration:duration center:center revert:revert animations:animations completion:nil];
}

- (void)animateCircularWithDuration:(NSTimeInterval)duration center:(CGPoint)center revert:(BOOL)revert animations:(void(^)())animations completion:(void(^)(BOOL finished)) completion {
    
    UIView *snapShot = [self snapshotViewAfterScreenUpdates:false];
    snapShot.frame = self.bounds;
    [self addSubview:snapShot];
    
    CGPoint pointInSnapShot = [self convertPoint:center toView:snapShot];

    CGFloat x = pointInSnapShot.x > self.frame.size.width - pointInSnapShot.x ? pointInSnapShot.x : self.frame.size.width - pointInSnapShot.x;
    CGFloat y = pointInSnapShot.y > self.frame.size.height - pointInSnapShot.y ? pointInSnapShot.y : self.frame.size.height - pointInSnapShot.y;
    CGFloat radius = sqrt(x * x + y * y);
    
    SPCircularRevealAnimator *animation = nil;
    
    if (!revert) {
        animation = [[SPCircularRevealAnimator alloc] initWithLayer:snapShot.layer center:center startRadius:0 endRadius:radius invert:true];
    }else {
        animation = [[SPCircularRevealAnimator alloc] initWithLayer:snapShot.layer center:center startRadius:radius endRadius:0 invert:false];
    }
    animation.duration = duration;
    animation.completion = ^{
        [snapShot removeFromSuperview];
        if (completion) {
            completion(true);
        }
    };
    [animation start];
    animations();
}

@end
