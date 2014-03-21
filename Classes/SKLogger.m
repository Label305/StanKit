//
//  SKLogger.m
//  StanKitExample
//
//  Created by Thijs Scheepers on 04/02/14.
//  Copyright (c) 2014 Label305. All rights reserved.
//

#import "SKLogger.h"


@implementation SKLogger

+ (void)setupWithTestFlightToken:(NSString *)testFlightToken crashlyticsAPIKey:(NSString *)crashlyticsAPIKey
{
    [self setupTestFlightWithToken:testFlightToken];
    [self setupCrashlyticsWithAPIKey:crashlyticsAPIKey];
}

+ (void)setupTestFlightWithToken:(NSString *)testFlightToken
{
    [TestFlight setOptions:@{ TFOptionLogToConsole : @NO }];
    [TestFlight setOptions:@{ TFOptionLogToSTDERR : @NO }];
    
    // Enable the app to use TestFlight and send reports to TestFlight
    [TestFlight takeOff:testFlightToken];
}

+ (void)setupCrashlyticsWithAPIKey:(NSString *)crashlyticsAPIKey
{
#ifdef DEBUG
    NSLog(@"Do not forget to add the Crashlytics script to your build steps. \"./Pods/CrashlyticsFramework/Crashlytics.framework/run %@\" ", crashlyticsAPIKey);
    NSLog(@"WARNING, Crashlytics not enabled due to the DEBUG macro.");
#else
    [Crashlytics startWithAPIKey:crashlyticsAPIKey];
#endif
}

+ (void)logFor:(NSString *)methodDescription lineNumber:(NSInteger)lineNumber messageWithFormat :(NSString *)formatString, ...
{
    va_list args;
    va_start(args, formatString);
    NSString *contents = [[NSString alloc] initWithFormat:formatString arguments:args];
    va_end(args);

    // %p is the address of an object
    NSString *log = [NSString stringWithFormat:@"%@:%ld %@",methodDescription,(long)lineNumber,contents];
    
#ifndef DEBUG
    CLSLog(@"%@",log); // CLSLogs is a silence logs and does not call NSLog
#endif
    
    TFLog(@"%@",log);

#ifdef DEBUG
    NSLog(@"%@",log);
#endif

}

+ (void)passCheckpoint:(NSString *)string
{
    if(string != nil) {
        [TestFlight passCheckpoint:string];
#ifndef DEBUG
        CLS_LOG(@"Checkpoint: %@",string);
#endif
    }
}

+ (void)setUserEmail:(NSString *)email
{
    if(email != nil) {
        [Crashlytics setUserEmail:email];
        TFLog(@"E-mail: %@",email);
    }
}

@end
