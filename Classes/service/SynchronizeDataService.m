//
//  SynchronizeDataService.m
//  omedia
//
//  Created by xu hongfeng on 11-10-7.
//  Copyright 2011 THU. All rights reserved.
//

#import "SynchronizeDataService.h"
#import "omediaAppDelegate.h"
#import "HttpService.h"
#import "CoreDataService.h"
#import "CoreDataException.h"
#import "Account.h"
#import "UrlUtil.h"
#import "JsonUtil.h"
#import "Cache.h"
#import "Friend.h"
#import "FriendRequest.h"
#import "MainController.h"
#import "FriendRequestController.h"

static int timerStarted=0;

@implementation SynchronizeDataService


-(void) synchronizeData {
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	if (accountId == 0) {
		return;
	}
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	HttpService* httpService = self.ownerController.httpService;
	@try {
		Account* account =  [coreDataService getAccountWithId:accountId];
		NSNumber* friendRequestVersion = [self omediatAppDelegate].friendRequestCache.version;
		NSNumber* friendsVersion = [self omediatAppDelegate].friendsCache.version;
		NSString* url = [UrlUtil checkDataVersionUrlWithAccountId:accountId
														withToken:account.token
											   withAccountVersion:account.version
										 withFriendRequestVersion:friendRequestVersion
											   withFriendsVersion:friendsVersion];
		[httpService httpGet:url withTimeout:20.0 withCallback:@selector(synchronizeCallback:)
				  withTarget:self];
	}
	@catch (CoreDataException* e) {
		[self.ownerController showAlert:[e description] buttonLabel:@"确定"];
	}
}

-(void) synchronizeCallback:(NSString*)json {
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	HttpService* httpService = self.ownerController.httpService;
	//解析http返回的json数据
	//{"result":1,"account":int} account=1表示需要更新account的数据,account=0表示数据已同步
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		@try {
			NSNumber* accountId = [self omediatAppDelegate].accountId;
			Account* account = [coreDataService getAccountWithId:accountId];
			
			NSNumber* accountState = [jsonObject valueForKey:@"account"];
			NSNumber* friendRequestState = [jsonObject valueForKey:@"friendRequest"];
			NSNumber* friendsState = [jsonObject valueForKey:@"friends"];
			
			if ([accountState integerValue] == 1) { //更新account数据
				NSString* url = [UrlUtil getAccountUrlWithAccountId:accountId withToken:account.token];
				[httpService httpGet:url withTimeout:20.0 withCallback:@selector(getAccountCallback:) withTarget:self];
			}
			if ([friendRequestState integerValue] == 1) { //更新friendRequestCache数据
				NSString* url = [UrlUtil getFriendRequestUrlWithAccountId:accountId withToken:account.token];
				[httpService httpGet:url withTimeout:20.0 withCallback:@selector(getFriendRequestCallback:) withTarget:self];
			}
			if([friendsState integerValue] ==1) {//更新friendsCache数据
				NSString* url = [UrlUtil getFriendsWithAccountId:accountId withToken:account.token];
				[httpService httpGet:url withTimeout:20.0 withCallback:@selector(getFriendsCallback:) withTarget:self];
			}
			
			[coreDataService saveContext];
		}
		@catch (CoreDataException * e) {
			[self.ownerController showAlert:[e description] buttonLabel:@"确定"];
		}
	} else if ([result integerValue] == 3) {//token认证错误
		[self.ownerController showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.ownerController.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self.ownerController showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

-(void) getAccountCallback:(NSString*)json {
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	//解析http返回的json数据
	//{"result":1,"account":json , "version":long}
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		@try {
			NSString* email = [jsonObject valueForKey:@"email"];
			NSString* address = [jsonObject valueForKey:@"address"];
			NSString* phone = [jsonObject valueForKey:@"phone"];
			NSString* realName = [jsonObject valueForKey:@"realName"];
			NSNumber* version = [jsonObject valueForKey:@"version"];
			NSNumber* accountId = [self omediatAppDelegate].accountId;
			Account* account = [coreDataService getAccountWithId:accountId];
			account.email = email;
			account.address = address;
			account.phone  = phone;
			account.realName = realName;
			account.version = version;
			[coreDataService saveContext];
		}
		@catch (CoreDataException * e) {
			[self.ownerController showAlert:[e description] buttonLabel:@"确定"];
		}
	} else if ([result integerValue] == 3) {//token认证错误
		[self.ownerController showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.ownerController.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self.ownerController showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}


-(void) getFriendRequestCallback:(NSString*)json {
	//解析http返回的json数据
	//{"result":1,"requests":json}
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		@try {
			Cache* cache = [self omediatAppDelegate].friendRequestCache;
			int oldCount = [cache.dataArray count];
			[cache.dataArray removeAllObjects];
			NSArray* requests = [jsonObject valueForKey:@"requests"];
			NSNumber* version = [jsonObject valueForKey:@"version"];
			for (NSDictionary* request in requests) {
				NSString* msg = [request valueForKey:@"msg"];
				NSNumber* timeMill = [request valueForKey:@"time"];
				int seconds = (int)([timeMill floatValue]/1000);
				NSDate* time = [NSDate dateWithTimeIntervalSince1970:seconds];
				NSDictionary* dFriend = [request valueForKey:@"friend"];
				Friend* friend = [[Friend alloc] initWithDictionary:dFriend];
				FriendRequest* fr = [[FriendRequest alloc]initWithFriend:friend withMsg:msg withTime:time];
				[cache.dataArray addObject:fr];
				[friend release];
				[fr release];
			}
			cache.version = version;
			int newCount = [cache.dataArray count];
			if (newCount!=oldCount) {
				[[self omediatAppDelegate].currentController reloadData];
			}
		}
		@catch (OmediaException * e) {
			[self.ownerController showAlert:[e description] buttonLabel:@"确定"];
		}
	} else if ([result integerValue] == 3) {//token认证错误
		[self.ownerController showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.ownerController.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self.ownerController showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
} 

-(void) getFriendsCallback:(NSString*)json {
	//解析http返回的json数据
	//{"result":1,"friends":json , "version":long}
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		@try {
			Cache* cache = [self omediatAppDelegate].friendsCache;
			int oldCount = [cache.dataArray count];
			[cache.dataArray removeAllObjects];
			NSArray* friends = [jsonObject valueForKey:@"friends"];
			NSNumber* version = [jsonObject valueForKey:@"version"];
			for (NSDictionary* e in friends) {
				Friend* friend = [[Friend alloc] initWithDictionary:e];
				[cache.dataArray addObject:friend];
				[friend release];
			}
			cache.version = version;
			int newCount = [cache.dataArray count];
			if (newCount!=oldCount) {
				[[self omediatAppDelegate].currentController reloadData];
			}
		}
		@catch (OmediaException * e) {
			[self.ownerController showAlert:[e description] buttonLabel:@"确定"];
		}
	} else if ([result integerValue] == 3) {//token认证错误
		[self.ownerController showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.ownerController.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self.ownerController showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

-(void) startSynchronizeTimer {
	if (timerStarted) {
		return;
	}
	NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
	NSDate* startTime = [NSDate dateWithTimeIntervalSinceNow:10.0];
	NSTimer* updateDataTimer = [[NSTimer alloc]initWithFireDate:startTime 
													   interval:10.0 
														 target:self 
													   selector:@selector(synchronizeData) 
													   userInfo:nil 
														repeats:YES];
	[runLoop addTimer:updateDataTimer forMode:NSDefaultRunLoopMode];
	[updateDataTimer autorelease];
	timerStarted = 1;
}


@end
