//
//  OLAnimationDelegate.h
//  SPCircularAnimation
//
//  Created by SnoopPanda on 16/9/2.
//  Copyright © 2016年 SnoopPanda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SPAnimationDelegate : NSObject
- (instancetype)initWithCompletion:(void(^)())completion;
@end
