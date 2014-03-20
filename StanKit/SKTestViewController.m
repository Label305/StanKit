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
    
    [viewWithGestureRecognizer addGestureRecognizer:[UITapGestureRecognizer instanceWithActionBlock:^(UIGestureRecognizer *sender) {
        NSLog(@"Test");
    }]];
    
    [self.view addSubview:viewWithGestureRecognizer];
}

@end
