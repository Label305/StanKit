StanKit [![Build Status](https://travis-ci.org/Label305/StanKit.svg?branch=master)](https://travis-ci.org/Label305/StanKit)
=======

iOS library with various extensions on the default iOS SDK, used at Label305 for app development.

CocoaPods
---------

Add the following line to your Podfile: `pod 'StanKit', :git => "https://github.com/Label305/StanKit.git"`.

Features
---------
* An easy logger to log to remote services like TestFlight and Crashlytics.
* Google Analytics event and screen API
* Block methods for `UIResponder`, `UIAlertView` and `UIGestureRecognizer`.
* [Runscope](http://runscope.com) category for `NSURL`.
* `NSObject` selector swizzle methods.

Usage
---------

```objective-c
#import <StanKit/StanKit.h>
#import <StanKit/Analytics.h>
```

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SKLoggerMode loggerMode = SKLoggerModeRelease;
#ifdef DEBUG
    loggerMode = SKLoggerModeDebug;
#endif
#ifdef TESTING
    loggerMode = SKLoggerModeTesting;
#endif

    [SKLogger setupWithMode:loggerMode testFlightToken:@"abc-defg-hijk" crashlyticsAPIKey:@"abcdefghijk"];
    [SKAnalytics setupGoogleAnalyticsWithTrackingId:@"UA-xxx-1"];
    
    ...
}
```

```objective-c
// Log to the console, Crashlytics and TestFlight according to the SKLoggerMode
SKLog(@"Send a log message crashlytics and testflight");
```
```objective-c
// Send screen / event to Google Analytics. Also sends a Checkpoint to Crashlytics and TestFlight.
[[SKAnalytics sharedInstance] trackEventWithCategory:@"Account" action:@"Login" label:nil value:nil];
[[SKAnalytics sharedInstance] trackScreenWithName:@"Start_Screen"];
```

License
---------
Copyright 2014 Label305 B.V.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
