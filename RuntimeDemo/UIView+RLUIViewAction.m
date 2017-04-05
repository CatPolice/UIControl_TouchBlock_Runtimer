//
//  UIView+RLUIViewAction.m
//  RuntimeDemo
//
//  Created by runlin on 17/4/5.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "UIView+RLUIViewAction.h"
#import <objc/runtime.h>

static const void *RLUIViewActionEventBlockKey = "RLUIViewActionEventBlockKey";

@implementation UIView (RLUIViewAction)
-(void)addUIViewTouchBlock:(UIViewActionBlock)touchBlock{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callUIViewActionBlock:)];
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, &RLUIViewActionEventBlockKey, touchBlock ,OBJC_ASSOCIATION_COPY_NONATOMIC);
}




- (void)callUIViewActionBlock:(id)sender {
    
    UIViewActionBlock block = (UIViewActionBlock)objc_getAssociatedObject(self, &RLUIViewActionEventBlockKey);
    
    if (block) {
        block(sender);
    }
}


@end
