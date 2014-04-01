//
//  NSString+SKURLEncode.h
//  StanKit
//
//  Created by Thijs Scheepers on 01/04/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SKURLEncode)

/**
 Encode a string for use in URL, for example as GET parameter.
 */
- (NSString*)stringByEncodingForURL;

@end
