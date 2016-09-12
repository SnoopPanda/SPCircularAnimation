//
//  OLCircularRevealAnimator.m
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/2.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import "SPCircularRevealAnimator.h"
#import "SPAnimationDelegate.h"

@interface SPCircularRevealAnimator ()

@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) CAShapeLayer *mask;
@property (nonatomic, strong) CABasicAnimation *animation;

@end

@implementation SPCircularRevealAnimator

- (instancetype)initWithLayer:(CALayer *)layer center:(CGPoint)center startRadius:(CGFloat)startRadius endRadius:(CGFloat)endRadius invert:(BOOL)invert {
    if (self = [super init]) {
        CGPathRef startCirclePath = CGPathCreateWithEllipseInRect([self SquareAroundCircle:center radius:startRadius], NULL);
        CGPathRef endCirclePath = CGPathCreateWithEllipseInRect([self SquareAroundCircle:center radius:endRadius], NULL);
        
        CGPathRef startPath = startCirclePath;
        CGPathRef endPath = endCirclePath;
        if (invert) {
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddRect(path, nil, layer.bounds);
            CGPathAddPath(path, nil, startCirclePath);
            
            startPath = path;
            path = CGPathCreateMutable();
            CGPathAddRect(path, nil, layer.bounds);
            CGPathAddPath(path, nil, endCirclePath);
            endPath = path;
        }
        
        self.layer = layer;
        
        self.mask = [[CAShapeLayer alloc] init];
        self.mask.path = endPath;
        self.mask.fillRule = kCAFillRuleEvenOdd;
        
        self.animation = [[CABasicAnimation alloc] init];
        self.animation.keyPath = @"path";
        self.animation.fromValue = (__bridge id _Nullable)(startPath);
        self.animation.toValue = (__bridge id _Nullable)(endPath);
        self.animation.delegate = [[SPAnimationDelegate alloc] initWithCompletion:^{
            self.layer.mask = nil;
            self.animation.delegate = nil;
            self.completion();
        }];
    }
    return self;
}

- (void)setDuration:(CFTimeInterval)duration {
    _duration = duration;
    self.animation.duration = duration;
}

- (void)setTimingFunction:(CAMediaTimingFunction *)timingFunction {
    _timingFunction = timingFunction;
    self.animation.timingFunction = timingFunction;
}

- (void)start {
    self.layer.mask = self.mask;
    self.mask.frame = self.layer.bounds;
    [self.mask addAnimation:self.animation forKey:@"reveeal"];
}

- (CGRect)SquareAroundCircle:(CGPoint)center radius:(CGFloat)radius {
//    assert(0 <= radius, "radius must be a positive value");
    return CGRectInset(CGRectMake(center.x, center.y, 0, 0), -radius, -radius);
}

@end
