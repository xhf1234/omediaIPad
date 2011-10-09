//
//  Friend.m
//  omedia
//
//  Created by xu hongfeng on 11-10-9.
//  Copyright 2011 THU. All rights reserved.
//

#import "Friend.h"


@implementation Friend

@synthesize accountId;
@synthesize username;
@synthesize email;
@synthesize realName;
@synthesize address;
@synthesize phone;


-(void) dealloc {
	if(accountId != nil) [accountId release];
	if(username != nil) [username release];
	if(email != nil) [email release];
	if(realName != nil) [realName release];
	if(address != nil) [address release];
	if(phone != nil) [phone release];
	[super dealloc];
}
-(id) initWithDictionary:(NSDictionary*)dictionary {
	self = [super init];
	if(self) {
		self.accountId = [dictionary valueForKey:@"accountId"];
		self.username = [dictionary valueForKey:@"username"];
		self.email = [dictionary valueForKey:@"email"];
		self.realName = [dictionary valueForKey:@"realName"];
		self.address = [dictionary valueForKey:@"address"];
		self.phone = [dictionary valueForKey:@"phone"];
	}
	return self;
}


@end
