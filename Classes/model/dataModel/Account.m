// 
//  Account.m
//  omedia
//
//  Created by xu hongfeng on 11-10-2.
//  Copyright 2011 THU. All rights reserved.
//

#import "Account.h"


@implementation Account 

@dynamic address;
@dynamic password;
@dynamic realName;
@dynamic accountId;
@dynamic phone;
@dynamic email;
@dynamic username;
@dynamic token;

- (void) awakeFromInsert

{
	if (self.address == nil) {
		self.address = @"";
	}
	if (self.password == nil) {
		self.password = @"";
	}
	if (self.realName == nil) {
		self.realName = @"";
	}
	if (self.phone == nil) {
		self.phone = @"";
	}
	if (self.email == nil) {
		self.email = @"";
	}
	if (self.username == nil) {
		self.username= @"";
	}
}

@end
