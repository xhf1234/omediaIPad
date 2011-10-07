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

static int timerStarted=0;

@implementation SynchronizeDataService

-(void) synchronizeData {
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	if (accountId == 0) {
		return;
	}
	NSLog(@"running");
	CoreDataService* coreDataService = self.ownerController.coreDataService;
	HttpService* httpService = self.ownerController.httpService;
	@try {
		Account* account =  [coreDataService getAccountWithId:accountId];
		NSString* url = [UrlUtil checkDataVersionUrlWithAccountId:accountId
												withToken:account.token
										  withAccountVersion:account.version];
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
			
			if ([accountState integerValue] == 1) { //更新account数据
				NSString* url = [UrlUtil getAccountUrlWithAccountId:accountId withToken:account.token];
				[httpService httpGet:url withTimeout:20.0 withCallback:@selector(getAccountCallback:) withTarget:self];
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
	//{"result":1,"account":json}
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
