//
//  NSObject+Swizzle.m
//  StanKit
//
//  Created by Thijs Scheepers on 08/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)firstSelector toSelector:(SEL)secondSelector
{
    Method swizzleMethod = class_getInstanceMethod(self, firstSelector);
    Method method = class_getInstanceMethod(self, secondSelector);
    method_exchangeImplementations(method, swizzleMethod);
}

+ (void)swizzleClassSelector:(SEL)firstSelector toSelector:(SEL)secondSelector
{
    Method swizzleMethod = class_getClassMethod(self, firstSelector);
    Method method = class_getClassMethod(self, secondSelector);
    method_exchangeImplementations(method, swizzleMethod);
}

@end
