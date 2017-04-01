//
//  UIControl+TouchBlock.m
//  RuntimeDemo
//
//  Created by gavin on 16/8/20.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "UIControl+TouchBlock.h"
#import <objc/runtime.h>

static const void *RLUIControlTouchUpEventBlockKey = "RLUIControlTouchUpEventBlockKey";

@implementation UIControl (TouchBlock)

- (void)setTouchUpBlock:(UIControlTouchUpBlock)touchUpBlock {
    objc_setAssociatedObject(self,
                             RLUIControlTouchUpEventBlockKey,
                             touchUpBlock,
                             OBJC_ASSOCIATION_COPY);
    
    [self removeTarget:self
                action:@selector(onTouchUp:)
      forControlEvents:UIControlEventTouchUpInside];
    
    if (touchUpBlock) {
        [self addTarget:self
                 action:@selector(onTouchUp:)
       forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UIControlTouchUpBlock)touchUpBlock {
    return objc_getAssociatedObject(self, RLUIControlTouchUpEventBlockKey);
}

- (void)onTouchUp:(UIButton *)sender {
    UIControlTouchUpBlock touchUp = self.touchUpBlock;
    
    if (touchUp) {
        touchUp(sender);
    }
}

@end
