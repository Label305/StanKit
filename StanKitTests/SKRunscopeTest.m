//
//  SKRunscopeTest.m
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+SKRunscope.h"

@interface SKRunscopeTest : XCTestCase

@end

@implementation SKRunscopeTest

- (void)testRunscope
{
    NSURL *original = [NSURL URLWithString:@"http://www.beleeftwente.nl/api/rest"];

    NSURL *runscope = [original runscopeURLWithBucket:@"abcdefgh"];

    XCTAssert([[runscope absoluteString] isEqualToString:@"http://www-beleeftwente-nl-abcdefgh.eu1.runscope.net/api/rest"], @"%@ not correct", [runscope absoluteString]);
}

@end
