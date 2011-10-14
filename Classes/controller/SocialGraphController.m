    //
//  SocialGraphController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-14.
//  Copyright 2011 THU. All rights reserved.
//

#import "SocialGraphController.h"
#import "UrlUtil.h"
#import "omediaAppDelegate.h"
#import "Account.h"
#import "CoreDataService.h"
#import "AddFriendController.h"
#import "JsonUtil.h"
#import "Friend.h"
#import "FriendDetailsController.h"

@implementation SocialGraphController


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSString* url = [[request URL]path];
	if([url hasPrefix:@"/omedia/addfriend="]) {
		NSString* json = [url substringFromIndex:18];
		NSDictionary* dictionary = [JsonUtil readObject:json];
		Friend* friend = [[Friend alloc] initWithDictionary:dictionary];
		addFriendController.friend = friend;
		[popoverController setContentViewController:addFriendController];
		[popoverController presentPopoverFromRect: CGRectZero
										   inView:self.view
						 permittedArrowDirections:UIPopoverArrowDirectionAny
										 animated:YES];
		[friend release];
		return false;
	}
	else if([url hasPrefix:@"/omedia/friend="]) {
		NSString* json = [url substringFromIndex:15];
		NSDictionary* dictionary = [JsonUtil readObject:json];
		Friend* friend = [[Friend alloc] initWithDictionary:dictionary];
		friendDetailsController.friend = friend;
		[popoverController setContentViewController:friendDetailsController];
		[popoverController presentPopoverFromRect: CGRectZero
										   inView:self.view
						 permittedArrowDirections:UIPopoverArrowDirectionAny
										 animated:YES];
		[friend release];
		return false;
	}
	return true;
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSNumber* accountId = [self omediatAppDelegate].accountId;
	Account * account = [self.coreDataService getAccountWithId:accountId];
	NSString* strUrl = [UrlUtil socialGraphUrlWithAccountId:accountId withToken:account.token];
	NSURL* url = [NSURL URLWithString:strUrl];
	NSURLRequest* request = [NSURLRequest requestWithURL:url];
	[webView loadRequest:request];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(id) init {
	self = [super init];
	if(self) {
		addFriendController = [[AddFriendController alloc]init];
		friendDetailsController = [[FriendDetailsController alloc] init];
		popoverController = [[UIPopoverController alloc] initWithContentViewController:addFriendController];
		popoverController.popoverContentSize = CGSizeMake(600,300);
		addFriendController.popoverController = popoverController;
		friendDetailsController.popoverController = popoverController;
	}
	return self;
}

-(void) dealloc {
	[addFriendController release];
	[friendDetailsController release];
	[popoverController release];
	[super dealloc];
}


@end
