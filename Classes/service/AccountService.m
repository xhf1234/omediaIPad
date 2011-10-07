//
//  AccountService.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "AccountService.h"
#import "RegisterForm.h"
#import "LoginForm.h"
#import "SettingForm.h"
#import "HttpService.h"
#import "Account.h"
#import "omediaAppDelegate.h"
#import "CoreDataService.h"
#import "UrlUtil.h"


@implementation AccountService


-(id) initWithOwnerController:(BaseController *)controller {
	self = [super initWithOwnerController:controller];
	if(self) {
	}
	return self;
}

-(void) dealloc {
	[super dealloc];
}

-(void) regester:(RegisterForm *)form {
	HttpService* httpService = [self ownerController].httpService;
	NSString* url = [UrlUtil registerUrl:form];
	[httpService httpGet:url
			 withTimeout:20.0 withCallback:NSSelectorFromString(@"registerCallback:")];
}

-(void) login:(LoginForm *)form {
	HttpService* httpService = [self ownerController].httpService;
	NSString* url = [UrlUtil loginUrl:form];
	[httpService httpGet:url
			 withTimeout:20.0 withCallback:NSSelectorFromString(@"loginCallback:")];
}

-(void) setting:(SettingForm *)form {
	CoreDataService* coreDataService = [self ownerController].coreDataService;
	HttpService* httpService = [self ownerController].httpService;
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	Account* account = [coreDataService getAccountWithId:accountId];
	NSString* url = [UrlUtil settingUrl:form withAccountId:accountId withToken:account.token];
	[httpService httpGet:url withTimeout:20.0 withCallback:NSSelectorFromString(@"settingCallback:")];
}

@end
