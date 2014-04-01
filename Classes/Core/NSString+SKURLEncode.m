//
//  NSString+SKURLEncode.m
//  StanKit
//
//  Created by Thijs Scheepers on 01/04/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "NSString+SKURLEncode.h"

@implementation NSString (SKURLEncode)

- (NSString*)stringByEncodingForURL
{
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                        NULL,
                                                                        (CFStringRef)self,
                                                                        NULL,
                                                                        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                        kCFStringEncodingUTF8 );
}


@end
