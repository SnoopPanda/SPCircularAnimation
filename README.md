SPCircularAnimation
=================

## Example

![Screenshots_Row1](https://github.com/SnoopPanda/SPCircularAnimation/blob/master/Example/animation.gif)

## How to use

### Import

	#import "UIView+CircularAnimation.h"

### Implementation

	[self.view animateCircularWithDuration:0.5 center:self.view.center revert:self.revert animations:^{
        
        self.view.backgroundColor = [self randomColor];
    }];
