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
 Enumeration type for the logging mode.
 Dubug will not log to Crashlytics, Produciton will not log to Testflight.
 */
typedef NS_ENUM(NSInteger, SKLoggerMode) {
    SKLoggerModeDebug,
    SKLoggerModeTesting,
    SKLoggerModeRelease
};

/**
 Simple C-function to log something to the console and to the remote services.
 */
#define SKLog( s, ... ) [[SKLogger sharedLogger] logFor:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__] lineNumber:__LINE__ messageWithFormat:(s), ##__VA_ARGS__]

/**
 SKLogger is a supporting class to enable logging to several remote services.
 
 To start using this class you should call +setupWithMode:testFlightToken:crashlyticsAPIKey: in your application:didFinishLaunchingWithOptions:
 */
@interface SKLogger : NSObject



#pragma mark - Singleton

/**
 Get the shared logger object.
 
 @see setupWithMode:testFlightToken:crashlyticsAPIKey:
 */
+ (instancetype)sharedLogger;


#pragma mark - SKLogger

/**
 Set this property to enable debug functions like logging to the console.
 */
@property (readwrite, nonatomic) SKLoggerMode mode;

/**
 Check this property to see if Crahlytics is enabled for this instance of SKLogger
 */
@property (readonly, nonatomic, getter = isCrashlyticsEnabled) BOOL crashlyticsEnabled;

/**
 Check this property to see if TestFlight is enabled for this instance of SKLogger
 */
@property (readonly, nonatomic, getter = isTestFlightEnabled) BOOL testFlightEnabled;

/**
 Logs a certain message to the console and remote services.
 */
- (void)logFor:(NSString *)methodDescription lineNumber:(NSInteger)lineNumber messageWithFormat :(NSString *)formatString, ...;

/**
 Call to pass a checkpoint and send it to TestFlight.
 */
- (void)passCheckpoint:(NSString *)string;

/**
 Call to set the users email for loggin purposes.
 */
- (void)setUserEmail:(NSString *)email;

/**
 Call to set the users name for loggin purposes.
 */
- (void)setUserName:(NSString *)name;

/**
 Call to set the users identifier for loggin purposes.
 */
- (void)setUserIdentifier:(NSString *)identifier;



#pragma mark - Convinience methods

/**
 Call this method to initiate the sharedLogger. You should call this method in your application:didFinishLaunchingWithOptions:
 
 @param mode To set the mode, the specific mode controls the way things are logged and are used.
 @param testFlightToken The testFlightToken, pass nil if you don't wish to initialize testFlight
 @param crashlyticsAPIKey The crashlyticsAPIKey, pass nil if you don't wish to initialize crashlytics
 */
+ (void)setupWithMode:(SKLoggerMode)mode testFlightToken:(NSString *)testFlightToken crashlyticsAPIKey:(NSString *)crashlyticsAPIKey;

/**
 Call to pass a checkpoint and send it to TestFlight.
 
 @deprecated This method is deprecated use the instance method instead.
 */
+ (void)passCheckpoint:(NSString *)string;

/**
 Call to set the users email for loggin purposes.
 
 @deprecated This method is deprecated use the instance method instead.
 */
+ (void)setUserEmail:(NSString *)email;

@end
