//
//  SKAnalytics.m
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "SKAnalytics.h"

#import "SKLogger.h"

#import "GAI.h"
#import "GAITrackedViewController.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"


// Dispatch interval for sending data to Google
#define kDispatchInterval 20


@interface SKAnalytics ()

/**
 Set the shared instance object
 */
+ (void)setSharedInstance:(SKAnalytics *)instance;

/**
 Check this property to see if Google Analytics is enabled for this instance of SKAnalytics
 */
@property (readwrite, nonatomic, getter = isGoogleAnalyticsEnabled) BOOL googleAnalyticsEnabled;

@end



@implementation SKAnalytics



#pragma mark - Singleton

static SKAnalytics *sharedInstance = nil;

+ (instancetype)sharedInstance
{
    return sharedInstance;
}

+ (void)setSharedInstance:(SKAnalytics *)instance
{
    sharedInstance = instance;
}


#pragma mark - SKAnalytics

- (void)trackScreenWithName:(NSString *)screenName
{
    if (screenName == nil || [screenName isEqualToString:@""]) {
        [NSException raise:@"Internal Inconsistency Exception" format:@"The screenName parameter can not be nil."];
    }

    if ([self isGoogleAnalyticsEnabled]) {

        id tracker = [[GAI sharedInstance] defaultTracker];

        // This screen name value will remain set on the tracker and sent with
        // hits until it is set to a new value or to nil.
        [tracker set:kGAIScreenName
               value:screenName];

        [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    }

    [[SKLogger sharedLogger] passCheckpoint:[NSString stringWithFormat:@"Screen_%@", screenName]];
}

- (void)trackEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value
{

    if (category == nil || [category isEqualToString:@""]) {
        [NSException raise:@"Internal Inconsistency Exception" format:@"The category parameter can not be nil."];
    }

    if (action == nil || [action isEqualToString:@""]) {
        [NSException raise:@"Internal Inconsistency Exception" format:@"The action parameter can not be nil."];
    }

    if ([self isGoogleAnalyticsEnabled]) {

        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];

        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                              action:action
                                                               label:label
                                                               value:value] build]];
    }

    [[SKLogger sharedLogger] passCheckpoint:[NSString stringWithFormat:@"Event_%@_%@", category, action]];
}


#pragma mark - Convienence Methods

+ (void)setupGoogleAnalyticsWithTrackingId:(NSString *)trackingId
{

    SKAnalytics *analytics = [SKAnalytics new];
    SKLogger *logger = [SKLogger sharedLogger];

    if (logger == nil) {
        [NSException raise:@"Internal Inconsistency Exception" format:@"You should first set a shared instance of SKLogger before setting up SKAnalytics"];
    }

    if (logger.mode != SKLoggerModeDebug) {

        analytics.googleAnalyticsEnabled = YES;

        // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
        [GAI sharedInstance].dispatchInterval = kDispatchInterval;
        
        // Initialize tracker.
        id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:trackingId];

        // Set the app version
        NSString *majorVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        [tracker set:kGAIAppVersion value:[NSString stringWithFormat:@"iOS %@",majorVersion]];
    } else {
        SKLog(@"Google Analytics not enabled due to debug mode.");
    }

    [self setSharedInstance:analytics];
}

@end
