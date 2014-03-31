//
//  NSURL+SKRunscope.m
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "NSURL+SKRunscope.h"

@implementation NSURL (SKRunscope)

- (NSURL *)runscopeURLWithBucket:(NSString *)bucket
{
    NSString *newHost;
    newHost = [[self host]  stringByReplacingOccurrencesOfString:@"-" withString:@"--"]; //hyphens need to be doubled
    // We always need the EU server
    newHost = [NSString stringWithFormat:@"%@-%@.eu1.runscope.net", [newHost stringByReplacingOccurrencesOfString:@"." withString:@"-"], bucket];
    NSMutableString *newPath = [[NSMutableString alloc] initWithString:@""];

    [self.pathComponents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        if (idx != 0) {
            [newPath appendFormat:@"/%@", obj];
        }
    }];

    if ([self parameterString]) {
        [newPath appendFormat:@";%@", [self parameterString]];
    }
    if ([self query]) {
        [newPath appendFormat:@"?%@", [self query]];
    }

    NSString *newURLString = [NSString stringWithFormat:@"%@://%@%@", [self scheme], newHost, newPath];

    return [NSURL URLWithString:newURLString];
}

@end
