//
//  CLogEvent+Extensions.m
//  TouchCode
//
//  Created by Jonathan Wight on 9/30/11.
//  Copyright 2011 Jonathan Wight. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//     1. Redistributions of source code must retain the above copyright notice, this list of
//        conditions and the following disclaimer.
//
//     2. Redistributions in binary form must reproduce the above copyright notice, this list
//        of conditions and the following disclaimer in the documentation and/or other materials
//        provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY 2011 JONATHAN WIGHT ``AS IS'' AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 2011 JONATHAN WIGHT OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of 2011 Jonathan Wight.

#import "CLogEvent+Extensions.h"

@implementation CLogEvent (Extensions)

- (NSDictionary *)asDictionary;
    {
    NSMutableDictionary *theDictionary = [NSMutableDictionary dictionary];
    // session
    [theDictionary setObject:[NSNumber numberWithInteger:self.level] forKey:@"level"];
    [theDictionary setObject:self.timestamp forKey:@"timestamp"];
    if (self.sender.length > 0)
        {
        [theDictionary setObject:self.sender forKey:@"sender"];
        }
    if (self.facility.length > 0)
        {
        [theDictionary setObject:self.facility forKey:@"facility"];
        }
    if (self.message.length > 0)
        {
        [theDictionary setObject:self.message forKey:@"message"];
        }
    if (self.userInfo.count > 0)
        {
        [theDictionary setObject:self.userInfo forKey:@"userInfo"];
        }

    return([theDictionary copy]);
    }

- (NSData *)asJSON
    {
    NSMutableDictionary *theDictionary = [NSMutableDictionary dictionary];
    // session
    [theDictionary setObject:[NSNumber numberWithInteger:self.level] forKey:@"level"];
    [theDictionary setObject:[NSNumber numberWithDouble:[self.timestamp timeIntervalSince1970]] forKey:@"timestamp"];
    if (self.sender.length > 0)
        {
        [theDictionary setObject:self.sender forKey:@"sender"];
        }
    if (self.facility.length > 0)
        {
        [theDictionary setObject:self.facility forKey:@"facility"];
        }
    if (self.message.length > 0)
        {
        [theDictionary setObject:self.message forKey:@"message"];
        }
    if (self.userInfo.count > 0)
        {
        NSMutableDictionary *theUserInfo = [NSMutableDictionary dictionary];
        [self.userInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([NSJSONSerialization isValidJSONObject:obj])
                {
                [theUserInfo setObject:obj forKey:key];
                }
            else if ([obj respondsToSelector:@selector(asJSON)])
                {
                obj = [obj asJSON];
                [theUserInfo setObject:obj forKey:key];
                }
            }];

        [theDictionary setObject:theUserInfo forKey:@"userInfo"];
        }


    NSError *theError = NULL;
    NSData *theData = [NSJSONSerialization dataWithJSONObject:theDictionary options:NSJSONWritingPrettyPrinted error:&theError];
    if (theData == NULL)
        {
        fprintf(stderr, "%s", [[theError description] UTF8String]);
        }
    return(theData);
    }

@end
