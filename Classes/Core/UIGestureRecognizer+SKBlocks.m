//
//  UIGestureRecognizer+SKBlocks.m
//  StanKit
//


#import "UIGestureRecognizer+SKBlocks.h"
#import <objc/runtime.h>

@interface UIGestureRecognizer (SKBlocks_Internal)

/**
 The actual block
 */
@property (nonatomic, copy) void (^actionBlock) (UIGestureRecognizer* gesture);

/**
 The handle action method to call the block
 */
- (void)handleAction:(UIGestureRecognizer *)recognizer;

@end



@implementation UIGestureRecognizer (SKBlocks)

static char blockKey;

+ (instancetype)gestureRecognizerWithBlock:(SKGestureRecognizerBlock)action;
{
    id instance = [[[self class] alloc] initWithBlock:action];
    
    return instance;
}

- (instancetype)initWithBlock:(SKGestureRecognizerBlock)action;
{
    if ((self = [self initWithTarget:self action:@selector(handleAction:)])) {
        [self setActionBlock:action];
    }
    
    return self;
}



#pragma mark - Internal

- (void)handleAction:(UIGestureRecognizer *)recognizer;
{
    void (^action) (UIGestureRecognizer* gesture) = [self actionBlock];
    if (nil != action) {
        action(recognizer);
    }
}

- (SKGestureRecognizerBlock)actionBlock;
{
    return objc_getAssociatedObject(self, &blockKey);
}

- (void)setActionBlock:(SKGestureRecognizerBlock)block;
{
    objc_setAssociatedObject(self, &blockKey, block, OBJC_ASSOCIATION_COPY);
}

@end
