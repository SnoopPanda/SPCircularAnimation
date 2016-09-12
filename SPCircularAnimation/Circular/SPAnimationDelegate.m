//
//  OLAnimationDelegate.m
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/2.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import "SPAnimationDelegate.h"

@interface SPAnimationDelegate ()

@property (nonatomic, copy) void(^completion)();
@end

@implementation SPAnimationDelegate

- (instancetype)initWithCompletion:(void(^)())completion {
    if (self = [super init]) {
        self.completion = completion;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.completion();
    
}

@end
