//
//  UIButton+RLButtonActionBlock.m
//  RuntimeDemo
//
//  Created by runlin on 17/4/1.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "UIButton+RLButtonActionBlock.h"
#import <objc/runtime.h>

static const void *RLUIButtonTouchUpEventBlockKey = "RLUIButtonTouchUpEventBlockKey";


@implementation UIButton (RLButtonActionBlock)

-(void)addButtonTouchBlock:(UIButtonTouchBlock)touchBlock{
    objc_setAssociatedObject(self, &RLUIButtonTouchUpEventBlockKey, touchBlock ,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)callActionBlock:(id)sender {
    
    UIButtonTouchBlock block = (UIButtonTouchBlock)objc_getAssociatedObject(self, &RLUIButtonTouchUpEventBlockKey);
    
    if (block) {
        block(sender);
    }
}

@end
