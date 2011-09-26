//
//  AccountService.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "AccountService.h"
#import "RegisterForm.h"
#import "LoginForm.h"
#import "HttpService.h"

@implementation AccountService

-(id) initWithOwnerController:(BaseController *)controller {
	self = [super initWithOwnerController:controller];
	if(self) {
		httpService = [[HttpService alloc]initWithOwnerController:controller];
	}
	return self;
}

-(void) dealloc {
	[httpService release];
	[super dealloc];
}



-(void) regester:(RegisterForm *)form {
	NSString* url = [NSString stringWithFormat:@"http://166.111.137.72:10086/omedia/register.do?username=%@&password=%@&email=%@",form.username,form.password,form.email];
	[httpService httpGet:url
			 withTimeout:20.0 withCallback:NSSelectorFromString(@"registerCallback:")];
}

-(void) login:(LoginForm *)form {
	NSString* url = [NSString stringWithFormat:@"http://166.111.137.72:10086/omedia/login.do?username=%@&password=%@",form.username,form.password];
	[httpService httpGet:url
			 withTimeout:20.0 withCallback:NSSelectorFromString(@"loginCallback:")];
}

@end
