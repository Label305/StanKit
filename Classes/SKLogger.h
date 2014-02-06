//
//  SKLogger.h
//  StanKitExample
//
//  Created by Thijs Scheepers on 04/02/14.
//  Copyright (c) 2014 Label305. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CrashlyticsFramework/Crashlytics.h>
#import <TestFlightSDK/TestFlight.h>

#define SKLog( s, ... ) [SKLogger logFor:__PRETTY_FUNCTION__ lineNumber:__LINE__ messageWithFormat:(s), ##__VA_ARGS__]

@interface SKLogger : NSObject 

+ (void)setupWithTestFlightToken:(NSString *)testFlightToken crashlyticsAPIKey:(NSString *)crashlyticsAPIKey;

+ (void)logFor:(char *)methodDescription lineNumber:(NSInteger)lineNumber messageWithFormat :(NSString *)formatString, ...;

+ (void)passCheckpoint:(NSString *)string;

+ (void)setUserEmail:(NSString *)email;

@end
