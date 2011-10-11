//
//  FriendRequest.m
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import "FriendRequest.h"
#import "Friend.h"

@implementation FriendRequest

@synthesize friend;
@synthesize msg;
@synthesize time;

-(id) initWithFriend:(Friend *)aFriend withMsg:(NSString*)aMsg withTime:(NSDate*)aTime{
	self = [super init];
	if (self) {
		self.friend = aFriend;
		self.msg = aMsg;
		self.time = aTime;
	}
	return self;
}

- (void) dealloc {
	[time release];
	[friend release];
	[msg release];
	[super dealloc];
}

@end
