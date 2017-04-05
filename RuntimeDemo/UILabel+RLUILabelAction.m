//
//  UILabel+RLUILabelAction.m
//  RuntimeDemo
//
//  Created by runlin on 17/4/5.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "UILabel+RLUILabelAction.h"
#import <objc/runtime.h>

static const void *RLUILableActionEventBlockKey = "RLUILableActionEventBlockKey";

@implementation UILabel (RLUILabelAction)

-(void)addUILableTouchBlock:(UILableActionBlock)touchBlock{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callUILableActionBlock:)];
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, &RLUILableActionEventBlockKey, touchBlock ,OBJC_ASSOCIATION_COPY_NONATOMIC);
}




- (void)callUILableActionBlock:(id)sender {
    
    UILableActionBlock block = (UILableActionBlock)objc_getAssociatedObject(self, &RLUILableActionEventBlockKey);
    
    if (block) {
        block(sender);
    }
}

@end
