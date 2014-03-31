//
//  NSURL+SKRunscope.h
//  StanKit
//
//  Created by Thijs Scheepers on 31/03/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SKRunscope)

/**
 Generate a runscope URL with a specific bucket id
 
 From: https://github.com/hungtruong/Runscope-iOS/blob/master/RunscopeURLRequest.m
 
 @param bucket Your bucket identifier
 */
- (NSURL *)runscopeURLWithBucket:(NSString *)bucket;

@end
