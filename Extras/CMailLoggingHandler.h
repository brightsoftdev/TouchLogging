//
//  CMailLoggingHandler.h
//  TouchCode
//
//  Created by Jonathan Wight on 10/27/09.
//  Copyright 2011 toxicsoftware.com. All rights reserved.
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
//  THIS SOFTWARE IS PROVIDED BY JONATHAN WIGHT ``AS IS'' AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JONATHAN WIGHT OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of toxicsoftware.com.

#import <Foundation/Foundation.h>

#import <MessageUI/MessageUI.h>
#import "CLogging.h"

@interface CMailLoggingHandler : NSObject <CLoggingDestination, UIAlertViewDelegate, MFMailComposeViewControllerDelegate> {
	NSPredicate *predicate;
	UIViewController *viewController;
	NSArray *recipients;
	NSString *subject;
	NSString *body;
	//
	CLogging *logging;
	NSArray *sessions;
}

@property (readwrite, nonatomic, retain) NSPredicate *predicate;
@property (readwrite, nonatomic, retain) UIViewController *viewController;
@property (readwrite, nonatomic, retain) NSArray *recipients;
@property (readwrite, nonatomic, retain) NSString *subject;
@property (readwrite, nonatomic, retain) NSString *body;

@end
