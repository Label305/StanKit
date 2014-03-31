//
//  SKAnalytics.h
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKAnalytics : NSObject



#pragma mark - Singleton

/**
 Get the shared analytics object.

 @see setupWithMode:testFlightToken:crashlyticsAPIKey:
 */
+ (instancetype)sharedInstance;



#pragma mark - SKAnalytics

/**
 Check this property to see if Google Analytics is enabled for this instance of SKAnalytics
 */
@property (readonly, nonatomic, getter = isGoogleAnalyticsEnabled) BOOL googleAnalyticsEnabled;

/**
 Tracks the current screen with a certain name. Sends the data to Google Analytics. Also passes a checkpoint to SKLogger.
 
 @param screenName (required) please don't use whitespace in this name and use a generic name
 */
- (void)trackScreenWithName:(NSString *)screenName;

/**
 Track certain event. Sends the data to Google Analytics. Also passes a checkpoint to SKLogger.
 
 @param category (required) Event category
 @param action (required) Event action
 @param label
 @param value
 */
- (void)trackEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value;



#pragma mark - Convinence Methods

/**
 Starts Google Analytics
 
 If the SKLogger sharedLogger has mode SKLoggerModeDebug analytics will not be enabled.
 
 @param trackingId Should be something like UA-XXXX-Y, can be nil if you whish to disable Google Analytics
 */
+ (void)setupGoogleAnalyticsWithTrackingId:(NSString *)trackingId;

@end
