//
//  SKLogger.m
//  StanKitExample
//
//  Created by Thijs Scheepers on 04/02/14.
//  Copyright (c) 2014 Label305. All rights reserved.
//

#import "SKLogger.h"

@interface SKLogger ()

/**
 Set the shared logger object
 */
+ (void)setSharedLogger:(SKLogger *)logger;

/**
 Check this property to see if Crahlytics is enabled for this instance of SKLogger
 */
@property (readwrite, nonatomic, getter = isCrashlyticsEnabled) BOOL crashlyticsEnabled;

@end


@implementation SKLogger



#pragma mark - Singleton

static SKLogger *sharedLogger = nil;

+ (instancetype)sharedLogger
{
    return sharedLogger;
}

+ (void)setSharedLogger:(SKLogger *)logger
{
    sharedLogger = logger;
}



#pragma mark - SKLogger

- (void)logFor:(NSString *)methodDescription lineNumber:(NSInteger)lineNumber messageWithFormat :(NSString *)formatString, ...
{
    va_list args;
    va_start(args, formatString);
    NSString *contents = [[NSString alloc] initWithFormat:formatString arguments:args];
    va_end(args);

    NSString *log = [NSString stringWithFormat:@"%@:%ld $ %@",methodDescription,(long)lineNumber,contents];

    if ([self isCrashlyticsEnabled]) {
        CLSLog(@"%@",log); // CLSLogs is a silence logs and does not call NSLog
    }

    if (self.mode == SKLoggerModeDebug) {
        NSLog(@"%@",log);
    }
}

- (void)passCheckpoint:(NSString *)string
{
    if (string != nil) {
        SKLog(@"Checkpoint: %@",string);
    }
}

- (void)setUserEmail:(NSString *)email
{
    if (email != nil) {
        if ([self isCrashlyticsEnabled]) [Crashlytics setUserEmail:email];
        SKLog(@"User email: %@",email);
    }
}

- (void)setUserIdentifier:(NSString *)identifier
{
    if (identifier != nil) {
        if ([self isCrashlyticsEnabled]) [Crashlytics setUserIdentifier:identifier];
        SKLog(@"User identifier: %@",identifier);
    }
}

- (void)setUserName:(NSString *)name
{
    if (name != nil) {
        if ([self isCrashlyticsEnabled]) [Crashlytics setUserName:name];
        SKLog(@"User name: %@",name);
    }
}



#pragma mark - Convinience methods

+ (void)setupWithMode:(SKLoggerMode)mode testFlightToken:(NSString *)testFlightToken crashlyticsAPIKey:(NSString *)crashlyticsAPIKey
{
    [self setupWithMode:mode crashlyticsAPIKey:crashlyticsAPIKey];
}

+ (void)setupWithMode:(SKLoggerMode)mode crashlyticsAPIKey:(NSString *)crashlyticsAPIKey
{
    SKLogger *logger = [SKLogger new];
    logger.mode = mode;

    if (crashlyticsAPIKey != nil) {

        if (mode != SKLoggerModeDebug) {

            logger.crashlyticsEnabled = YES;

            [Crashlytics startWithAPIKey:crashlyticsAPIKey];
        } else {
            NSLog(@"Do not forget to add the Crashlytics script to your build steps. \"./Pods/CrashlyticsFramework/Crashlytics.framework/run %@\" ", crashlyticsAPIKey);
            NSLog(@"WARNING, Crashlytics not enabled due to the SKLoggerModeDebug mode.");
        }
    }

    [self setSharedLogger:logger];

    if (mode == SKLoggerModeDebug) {
        SKLog(@"SKLogger initiated with mode SKLoggerModeDebug");
    } else if (mode == SKLoggerModeTesting) {
        SKLog(@"SKLogger initiated with mode SKLoggerModeTesting");
    } else if (mode == SKLoggerModeRelease) {
        SKLog(@"SKLogger initiated with mode SKLoggerModeRelease");
    }
}

+ (void)passCheckpoint:(NSString *)string
{
    [[SKLogger sharedLogger] passCheckpoint:string];
}

+ (void)setUserEmail:(NSString *)email
{
    [[SKLogger sharedLogger] setUserEmail:email];
}



@end
