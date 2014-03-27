//
//  SKTestViewController.m
//  StanKit
//
//  Created by Thijs Scheepers on 20/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "SKTestViewController.h"
#import "StanKit.h"

@interface SKTestViewController ()

@end

@implementation SKTestViewController

- (void)loadView
{
    [super loadView];
    
    UIView *viewWithGestureRecognizer = [UIView new];
    viewWithGestureRecognizer.backgroundColor = [UIColor redColor];
    viewWithGestureRecognizer.frame = CGRectMake(200, 200, 100, 100);
    
    [viewWithGestureRecognizer addGestureRecognizer:[UITapGestureRecognizer gestureRecognizerWithBlock:^(UIGestureRecognizer *sender) {
        NSLog(@"Test1");
    }]];
    
    [self.view addSubview:viewWithGestureRecognizer];
    
    UIButton *buttonWithBlockAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonWithBlockAction.frame = CGRectMake(200, 300, 100, 100);
    [buttonWithBlockAction setTitle:@"Test" forState:UIControlStateNormal];
    
    [buttonWithBlockAction addActionForControlEvents:UIControlEventTouchUpInside usingBlock:^(UIControl *sender, UIEvent *event) {
        NSLog(@"Test2");
    }];
    
    [self.view addSubview:buttonWithBlockAction];

}

@end
