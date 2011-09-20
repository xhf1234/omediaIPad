//
//  RegisterForm.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "RegisterForm.h"
#import "Account.h"


@implementation RegisterForm

-(BaseDataModel*) toDataModel {
	Account* account = [[Account alloc]init];
	account.username = self.username;
	account.password = self.password;
	[account autorelease];
	return account;
}

-(NSString*) validate {
	//TODO
	return nil;
}

-(void) dealloc {
	[username release];
	[password release];
	[confirmPassword release];
	[email release];
	[super dealloc];
}

@synthesize username;
@synthesize password;
@synthesize confirmPassword;
@synthesize email;

@end
