//
//  UIView+RLUIViewAction.h
//  RuntimeDemo
//
//  Created by runlin on 17/4/5.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIViewActionBlock)(id sender);

@interface UIView (RLUIViewAction)



-(void)addUIViewTouchBlock:(UIViewActionBlock)touchBlock;

@end
