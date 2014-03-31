//
//  StanKitTests.m
//  StanKitTests
//
//  Created by Thijs Scheepers on 07/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SKLogger.h"

@interface StanKitTests : XCTestCase

@end

@implementation StanKitTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    [SKLogger setupWithMode:SKLoggerModeDebug testFlightToken:nil crashlyticsAPIKey:nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLog
{
    [[SKLogger sharedLogger] logFor:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__] lineNumber:__LINE__ messageWithFormat:@"test %@",@"test2"];
    
    XCTAssert(YES, @"Always true");
}

@end
