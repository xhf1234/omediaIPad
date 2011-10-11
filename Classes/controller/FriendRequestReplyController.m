    //
//  FriendRequestReplyController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import "FriendRequestReplyController.h"
#import "FriendRequestReplyForm.h"
#import "OmediaException.h"
#import "FriendsService.h"
#import "omediaAppDelegate.h"
#import "SynchronizeDataService.h"
#import "JsonUtil.h"

@implementation FriendRequestReplyController

@synthesize form;

- (IBAction)actionAgree:(id)sender {
	[indicator startAnimating];
    form.reply = [NSNumber numberWithInt:1];
	@try {
		[self.friendService friendRequestReply:form];
	}
	@catch (OmediaException * e) {
		[indicator stopAnimating];
		[self showAlert:[e description] buttonLabel:@"确定"];
	}
}

- (IBAction)actionReject:(id)sender {
	[indicator startAnimating];
    form.reply = [NSNumber numberWithInt:0];
	@try {
		[self.friendService friendRequestReply:form];
	}
	@catch (OmediaException * e) {
		[indicator stopAnimating];
		[self showAlert:[e description] buttonLabel:@"确定"];
	}
}

-(void) friendRequestReplyCallback:(NSString*)json {
	//停止进度条
	[indicator stopAnimating];
	//解析http返回的json数据
	//{"result":1} 请求添加好友成功
	//{"result":3} token认证失败
	//{"result":4} 好友请求不存在
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		[self showAlert:@"成功添加对方为好友." buttonLabel:@"确定"];
		[self.syncService synchronizeData];
		[popoverController dismissPopoverAnimated:YES];
	} else if([result integerValue] == 0) {//拒绝好友请求
		[self.syncService synchronizeData];
		[popoverController dismissPopoverAnimated:YES];
	} else if ([result integerValue] == 3) {//token认证错误
		[self showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.navigationController popToRootViewControllerAnimated:NO];
	} else if ([result integerValue] == 4) {//好友请求不存在
		[popoverController dismissPopoverAnimated:YES];
		[self showAlert:@"好友请求不存在" buttonLabel:@"确定"];
		[self.syncService synchronizeData];
	} else {//服务器错误
		[self showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

//override
-(void) httpError {
	[indicator stopAnimating];
	[super httpError];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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


- (id)init {
	self = [super init];
	if (self) {
		form = [[FriendRequestReplyForm alloc] init];
	}
	return self;
}
- (void)dealloc {
	[form release];
    [super dealloc];
}
@end
