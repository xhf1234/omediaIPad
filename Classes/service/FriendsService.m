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

@end
