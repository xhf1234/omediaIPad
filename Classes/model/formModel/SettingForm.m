//
//  SettingForm.m
//  omedia
//
//  Created by xu hongfeng on 11-9-26.
//  Copyright 2011 THU. All rights reserved.
//

#import "SettingForm.h"
#import "FormValidator.h"

@implementation SettingForm

@synthesize oldPassword;
@synthesize newPassword;
@synthesize confirmPassword;
@synthesize email;
@synthesize realName;
@synthesize phone;
@synthesize address;

-(id) init {
	self = [super init];
	if(self) {
		oldPassword = @"";
		newPassword = @"";
		confirmPassword = @"";
		email = @"";
		realName = @"";
		phone = @"";
		address = @"";
	}
	return self;
}

-(void) dealloc {
	[oldPassword release];
	[newPassword release];
	[confirmPassword release];
	[email release];
	[realName release];
	[phone release];
	[address release];
	[super dealloc];
}

-(NSString*) validate {
	if (![FormValidator validateIsEmpty:oldPassword]
			||![FormValidator validateIsEmpty:newPassword]
			||![FormValidator validateIsEmpty:confirmPassword]) {
		if([FormValidator validateIsEmpty:oldPassword]) {
			return @"旧密码不能为空";
		}
		if ([FormValidator validate:oldPassword lessThan:6]) {
			return @"旧密码不能少于6位";
		}
		if ([FormValidator validate:oldPassword moreThan:32]) {
			return @"旧密码不能大于32位";
		}
		if (![FormValidator validateIsAlphaOrDigit:oldPassword]) {
			return @"旧密码只能是字母或数字";
		}
		if([FormValidator validateIsEmpty:newPassword]) {
			return @"新密码不能为空";
		}
		if ([FormValidator validate:newPassword lessThan:6]) {
			return @"新密码不能少于6位";
		}
		if ([FormValidator validate:newPassword moreThan:32]) {
			return @"新密码不能大于32位";
		}
		if (![FormValidator validateIsAlphaOrDigit:newPassword]) {
			return @"新密码只能是字母或数字";
		}
		if (![newPassword isEqualToString:confirmPassword]) {
			return @"两次密码输入不一致";
		}
	}
	if (![FormValidator validateIsEmail:email]) {
		return @"email格式不正确";
	}
	if(![FormValidator validateIsEmpty:realName] && [FormValidator validate:realName moreThan:32]) {
		return @"名字过长";
	}
	if(![FormValidator validateIsEmpty:phone] && [FormValidator validate:phone moreThan:32]) {
		return @"电话号码过长";
	}
	if(![FormValidator validateIsEmpty:address] && [FormValidator validate:address moreThan:255]) {
		return @"住址过长";
	}
	return nil;
}

@end
