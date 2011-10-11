//
//  FriendsService.m
//  omedia
//
//  Created by xu hongfeng on 11-10-8.
//  Copyright 2011 THU. All rights reserved.
//

#import "FriendsService.h"
#import "HttpService.h"
#import "CoreDataService.h"
#import "UrlUtil.h"
#import "omediaAppDelegate.h"
#import "Account.h"
#import "AddFriendForm.h"
#import "FriendRequestReplyForm.h"

@implementation FriendsService

-(void) searchFriends:(NSString *)keyword {
	HttpService* httpService = self.ownerController.httpService;
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	Account* account = [coreDataService getAccountWithId:accountId];
	NSNumber* token = account.token;
	NSString* url = [UrlUtil searchFriendsUrlWithAccountId:accountId
												 withToken:token
											   withKeyword:keyword];
	[httpService httpGet:url withTimeout:20.0 withCallback:NSSelectorFromString(@"searchFriendsCallback:") withTarget:[self ownerController]];
}

-(void) addFriend:(AddFriendForm *)form {
	HttpService* httpService = self.ownerController.httpService;
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	Account* account = [coreDataService getAccountWithId:accountId];
	NSNumber* token = account.token;
	NSString* url = [UrlUtil addFriendUrlWithAccountId:accountId
											withToken:token
										    withFriendId:form.friendId
											   withMsg:form.msg];
	[httpService httpGet:url withTimeout:20.0 withCallback:NSSelectorFromString(@"addFriendCallback:")
			  withTarget:[self ownerController]];
}

-(void) friendRequestReply:(FriendRequestReplyForm *)form {
	HttpService* httpService = self.ownerController.httpService;
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	Account* account = [coreDataService getAccountWithId:accountId];
	NSNumber* token = account.token;
	NSString* url = [UrlUtil friendRequestReplyUrlWithAccountId:accountId
													  withToken:token withForm:form];
	[httpService httpGet:url withTimeout:20.0 withCallback:NSSelectorFromString(@"friendRequestReplyCallback:")
			  withTarget:[self ownerController]];
}

-(void) deleteFriend:(NSNumber *)friendId {
	HttpService* httpService = self.ownerController.httpService;
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	Account* account = [coreDataService getAccountWithId:accountId];
	NSNumber* token = account.token;
	NSString* url = [UrlUtil deleteFriendsUrlWithAccountId:accountId
												withToken:token
											  withFriendId:friendId];
	[httpService httpGet:url withTimeout:20.0 withCallback:NSSelectorFromString(@"deleteFriendCallback:")
			  withTarget:[self ownerController]];
}

@end
