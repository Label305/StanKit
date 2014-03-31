//
//  UIAlertView+SKBlocks.m
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "UIAlertView+SKBlocks.h"
#import "SKLogger.h"
#import <objc/runtime.h>

static char DISMISS_IDENTIFER;
static char CANCEL_IDENTIFER;

@implementation UIAlertView (SKBlocks)



#pragma mark - Properties

@dynamic cancelBlock;
@dynamic dismissBlock;

- (void)setDismissBlock:(SKAlertViewDismissBlock)dismissBlock
{
    objc_setAssociatedObject(self, &DISMISS_IDENTIFER, dismissBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (SKAlertViewDismissBlock)dismissBlock
{
    return objc_getAssociatedObject(self, &DISMISS_IDENTIFER);
}

- (void)setCancelBlock:(SKAlertViewCancelBlock)cancelBlock
{
    objc_setAssociatedObject(self, &CANCEL_IDENTIFER, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (SKAlertViewCancelBlock)cancelBlock
{
    return objc_getAssociatedObject(self, &CANCEL_IDENTIFER);
}



#pragma mark - SKBlocks

+ (UIAlertView*) alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtons
                          onDismiss:(SKAlertViewDismissBlock) dismissed
                           onCancel:(SKAlertViewCancelBlock) cancelled
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];

    [alert setDismissBlock:dismissed];
    [alert setCancelBlock:cancelled];

    for (NSString *buttonTitle in otherButtons) {
        [alert addButtonWithTitle:buttonTitle];
    }

    if ([SKLogger sharedLogger] != nil) {
        SKLog(@"Alert shown: %@ - %@", title, message);
    }

    [alert show];

    return alert;
}

+ (UIAlertView*) alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
{
    return [UIAlertView alertViewWithTitle:title
                                   message:message
                         cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")];
}

+ (UIAlertView*) alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];

    if ([SKLogger sharedLogger] != nil) {
        SKLog(@"Alert shown: %@ - %@", title, message);
    }

    [alert show];
    return alert;
}



#pragma mark - UIAlertViewDelegate

+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {

	if (buttonIndex == [alertView cancelButtonIndex]) {
		if (alertView.cancelBlock) {
            alertView.cancelBlock();
        }
	} else {
        if (alertView.dismissBlock) {
            alertView.dismissBlock(buttonIndex - 1); // cancel button is button 0
        }
    }
}

@end
