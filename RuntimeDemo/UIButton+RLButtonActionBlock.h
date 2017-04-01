//
//  UIButton+RLButtonActionBlock.h
//  RuntimeDemo
//
//  Created by runlin on 17/4/1.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIButtonTouchBlock)(id sender);

@interface UIButton (RLButtonActionBlock)

-(void)addButtonTouchBlock:(UIButtonTouchBlock)touchBlock;

@end
