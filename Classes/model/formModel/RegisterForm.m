//
//  RegisterForm.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "RegisterForm.h"
#import "Account.h"
#import "FormValidator.h"


@implementation RegisterForm

-(BaseDataModel*) toDataModel {
	Account* account = [[Account alloc]init];
	account.username = self.username;
	account.password = self.password;
	[account autorelease];
	return account;
}

-(NSString*) validate {
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
	if (![self.password isEqualToString:self.confirmPassword]) {
		return @"两次密码输入不一致";
	}
	if (![FormValidator validateIsEmail:self.email]) {
		return @"email格式不正确";
	}
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
