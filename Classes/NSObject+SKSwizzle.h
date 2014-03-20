//
//  NSObject+Swizzle.h
//  StanKit
//
//  Created by Thijs Scheepers on 08/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SKSwizzle)

/**
 Switches out instance selectors. Can be handy for testing to disable certain iOS features.
 From: http://stackoverflow.com/questions/15558301/how-to-automatically-click-ok-in-response-to-app-would-like-to-use-your-curre
 */
+ (void)swizzleInstanceSelector:(SEL)firstSelector toSelector:(SEL)secondSelector;

/**
 Switches out class selectors. Can be handy for testing to disable certain iOS features.
 */
+ (void)swizzleClassSelector:(SEL)firstSelector toSelector:(SEL)secondSelector;

@end
