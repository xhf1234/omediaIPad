//
//  Account.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "Account.h"


@implementation Account

-(void) dealloc {
	[username release];
	[password release];
	[email release];
	[super dealloc];
}

@synthesize username;
@synthesize password;
@synthesize email;

@end
