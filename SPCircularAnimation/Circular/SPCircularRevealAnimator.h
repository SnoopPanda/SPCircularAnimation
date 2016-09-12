//
//  OLCircularRevealAnimator.h
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/2.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SPCircularRevealAnimator : NSObject

@property (nonatomic, assign) CFTimeInterval duration;
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;
@property (nonatomic, copy) void(^completion)();

- (instancetype)initWithLayer:(CALayer *)layer center:(CGPoint)center startRadius:(CGFloat)startRadius endRadius:(CGFloat)endRadius invert:(BOOL)invert;
- (void)start;

@end
