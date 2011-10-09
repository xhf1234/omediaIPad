//
//  BaseController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "BaseController.h"
#import "omediaAppDelegate.h"
#import "CoreDataService.h"
#import "AccountService.h"
#import "HttpService.h"
#import "SynchronizeDataService.h"
#import "FriendsService.h"

@implementation BaseController

@synthesize accountService;
@synthesize httpService;
@synthesize coreDataService;
@synthesize syncService;
@synthesize friendService;

-(void) dealloc {
	[syncService release];
	[accountService release];
	[coreDataService release];
	[httpService release];
	[friendService release];
	[super dealloc];
}

-(id) init {
	self = [super init];
	if(self) {
		accountService = [[AccountService alloc] initWithOwnerController:self];
		coreDataService = [[CoreDataService alloc] initWithOwnerController:self];
		httpService = [[HttpService alloc] initWithOwnerController:self];
		syncService = [[SynchronizeDataService alloc] initWithOwnerController:self];
		friendService = [[FriendsService alloc]initWithOwnerController:self];
	}
	return self;
}

- (void) back {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void) changeBackTitle:(NSString *)title {
	UIBarButtonItem* back = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
	[back release];
}

-(void) httpError {
	[self showAlert:@"网络错误" buttonLabel:@"确定"];
}

-(void) showAlert:(NSString*)message buttonLabel:(NSString*)buttonLabel {
	UIAlertView *alertDialog = [[UIAlertView alloc] initWithTitle:nil 
														  message:message
														 delegate:nil
												cancelButtonTitle:buttonLabel
												otherButtonTitles:nil];
    [alertDialog show];
    [alertDialog release];
}
- (omediaAppDelegate*)omediatAppDelegate {
	return (omediaAppDelegate*)[UIApplication sharedApplication].delegate;
}

@end
