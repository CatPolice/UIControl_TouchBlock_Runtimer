//
//  UILabel+RLUILabelAction.h
//  RuntimeDemo
//
//  Created by runlin on 17/4/5.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UILableActionBlock)(id sender);

@interface UILabel (RLUILabelAction)


-(void)addUILableTouchBlock:(UILableActionBlock)touchBlock;

@end
