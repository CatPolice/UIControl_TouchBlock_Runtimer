//
//  ViewController.m
//  RuntimeDemo
//
//  Created by gavin on 16/8/20.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+TouchBlock.h"
#import "UIButton+RLButtonActionBlock.h"
#import "UIView+RLUIViewAction.h"
#import "UILabel+RLUILabelAction.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIControl *testControl;
@property (weak, nonatomic) IBOutlet UIButton *buttonTouch;
@property (weak, nonatomic) IBOutlet UIView *viewTouch;
@property (weak, nonatomic) IBOutlet UILabel *uiLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testControl.touchUpBlock = ^(id sender){
        NSLog(@"%@",sender);
    };
    
    [self.buttonTouch addButtonTouchBlock:^(id sender) {
        NSLog(@"%@",sender);
        
    }];
    
    
    [self.viewTouch addUIViewTouchBlock:^(id sender) {
        NSLog(@"%@" , sender);
    }];
    

    [self.uiLable addUILableTouchBlock:^(id sender) {
        NSLog(@"%@",sender);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
