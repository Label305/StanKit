//
//  SKAppDelegate.m
//  StanKit
//
//  Created by Thijs Scheepers on 07/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "SKAppDelegate.h"
#import "SKTestViewController.h"
#import "StanKit.h"
#import "Analytics.h"


#define kTestFlightToken @"41c0d390-8af5-47f9-a600-4beb1d94274c"
#define kCrashlyticsAPIKey @"eb814520be52892fc29fc171c73b474b7e07603f"
#define kGoogleAnalyticsTrackingId @"UA-34268655-4"


@implementation SKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
#ifdef DEBUG
    [SKLogger setupWithMode:SKLoggerModeTesting testFlightToken:kTestFlightToken crashlyticsAPIKey:kCrashlyticsAPIKey];
#else
    [SKLogger setupWithMode:SKLoggerModeDebug testFlightToken:kTestFlightToken crashlyticsAPIKey:kCrashlyticsAPIKey];
#endif

    [SKAnalytics setupGoogleAnalyticsWithTrackingId:kGoogleAnalyticsTrackingId];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self.window setRootViewController:[SKTestViewController new]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
