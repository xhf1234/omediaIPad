//
//  LoginForm.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "LoginForm.h"
#import "Account.h"
#import "FormValidator.h"

@implementation LoginForm


-(id) init {
	self = [super init];
	if(self) {
		username = @"";
		password = @"";
	}
	return self;
}

-(void) dealloc {
	[username release];
	[password release];
	[super dealloc];
}

-(NSString *) validate {
	if([FormValidator validateIsEmpty:self.username]) {
		return @"用户名不能为空";
	}
	if ([FormValidator validate:self.username lessThan:4]) {
		return @"用户名不能少于4位";
	}
	if ([FormValidator validate:self.username moreThan:32]) {
		return @"用户名不能大于32位";
	}
	if (![FormValidator validateIsAlphaOrDigit:self.username]) {
		return @"用户名只能是字母或数字";
	}
	if([FormValidator validateIsEmpty:self.password]) {
		return @"密码不能为空";
	}
	if ([FormValidator validate:self.password lessThan:6]) {
		return @"密码不能少于6位";
	}
	if ([FormValidator validate:self.password moreThan:32]) {
		return @"密码不能大于32位";
	}
	if (![FormValidator validateIsAlphaOrDigit:self.password]) {
		return @"密码只能是字母或数字";
	}
	return nil;
}

@synthesize username;
@synthesize password;
@synthesize rememberPassword;

@end
