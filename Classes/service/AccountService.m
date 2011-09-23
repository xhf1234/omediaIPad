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
	[httpService httpGet:@"http://127.0.0.1:8080/omedia/register.do"
			 withTimeout:20.0 withCallback:NSSelectorFromString(@"registerCallback:")];
}

-(int) login:(LoginForm *)form {
	//TODO
	return 1;
}

@end
