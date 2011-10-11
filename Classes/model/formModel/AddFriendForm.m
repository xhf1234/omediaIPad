//
//  AddFriendForm.m
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import "AddFriendForm.h"
#import "FormValidator.h"

@implementation AddFriendForm
	
@synthesize friendId;
@synthesize msg;

-(NSString*) validate {
	if([FormValidator validate:msg moreThan:255]) {
		return @"留言长度超出范围";
	}
	return nil;
}

@end
