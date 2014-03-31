//
//  UIAlertView+SKBlocks.h
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SKAlertViewDismissBlock)(NSInteger buttonIndex);
typedef void (^SKAlertViewCancelBlock)();

/**
 Extends UIAlertView with handy block initializers.
 
 Also logs to [SKLogger sharedLogger] on show.
 */
@interface UIAlertView (SKBlocks) <UIAlertViewDelegate>

/**
 Convenience initializer for alert view. Will show the alert immediately. 
 */
+ (UIAlertView*) alertViewWithTitle:(NSString *)title
                            message:(NSString *)message;

/**
 Convenience initializer for alert view. Will show the alert immediately.
 */
+ (UIAlertView*) alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle;

/**
 Convenience initializer for alert view. Will show the alert immediately.
 */
+ (UIAlertView*) alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtons
                          onDismiss:(SKAlertViewDismissBlock) dismissed
                           onCancel:(SKAlertViewCancelBlock) cancelled;

/**
 The dismiss block which will be called when the alert will be dismissed.
 */
@property (nonatomic, copy) SKAlertViewDismissBlock dismissBlock;

/**
 The cancel block which will be called when the alert will be canceled.
 */
@property (nonatomic, copy) SKAlertViewCancelBlock cancelBlock;

@end
