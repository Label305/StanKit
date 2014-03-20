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

/**
 Simple C-function to log something to the console and to the remote services.
 */
#define SKLog( s, ... ) [SKLogger logFor:__PRETTY_FUNCTION__ lineNumber:__LINE__ messageWithFormat:(s), ##__VA_ARGS__]

/**
 SKLogger is a supporting class to enable logging to several remote services.
    
    TestFlight - (only on setting the TESTING macro)
    Crashlytics - (only on setting the DEBUG macro)
 */
@interface SKLogger : NSObject 

/**
 Convinience method that calls both setupTestFlightWithToken: and setupCrashlyticsWithAPIKey:
 
 @see setupCrashlyticsWithAPIKey:
 @see setupTestFlightWithToken:
 */
+ (void)setupWithTestFlightToken:(NSString *)testFlightToken crashlyticsAPIKey:(NSString *)crashlyticsAPIKey;

/**
 Starts TestFlight aproriate to the application setup.
 */
+ (void)setupTestFlightWithToken:(NSString *)testFlightToken;

/**
 Starts Crashlytics aproriate to the application setup.
 */
+ (void)setupCrashlyticsWithAPIKey:(NSString *)crashlyticsAPIKey;

/**
 Logs a certain message to the console and remote services.
 */
+ (void)logFor:(char [28])methodDescription lineNumber:(NSInteger)lineNumber messageWithFormat :(NSString *)formatString, ...;

/**
 Call to pass a checkpoint and send it to TestFlight.
 */
+ (void)passCheckpoint:(NSString *)string;

/**
 Call to set the users email for loggin purposes.
 */
+ (void)setUserEmail:(NSString *)email;

@end
