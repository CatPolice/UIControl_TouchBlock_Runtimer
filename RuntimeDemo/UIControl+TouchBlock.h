//
//  UIControl+TouchBlock.h
//  RuntimeDemo
//
//  Created by gavin on 16/8/20.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIControlTouchUpBlock)(id sender);

@interface UIControl (TouchBlock)

@property (nonatomic, copy) UIControlTouchUpBlock touchUpBlock;

@end
