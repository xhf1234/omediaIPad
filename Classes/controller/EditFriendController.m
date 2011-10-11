    //
//  EditFriendController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import "EditFriendController.h"
#import "OmediaException.h"
#import "FriendsService.h"
#import "SynchronizeDataService.h"
#import "omediaAppDelegate.h"
#import "JsonUtil.h"

@implementation EditFriendController

@synthesize friendId;

- (IBAction)actionDelete:(id)sender {
	[indicator startAnimating];
	@try {
		[self.friendService deleteFriend:friendId];
	}
	@catch (OmediaException * e) {
		[indicator stopAnimating];
		[self showAlert:[e description] buttonLabel:@"确定"];
	}
}

-(void) deleteFriendCallback:(NSString*)json {
	//停止进度条
	[indicator stopAnimating];
	//解析http返回的json数据
	//{"result":1} 请求添加好友成功
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		[self showAlert:@"删除成功" buttonLabel:@"确定"];
		[self.syncService synchronizeData];
		[popoverController dismissPopoverAnimated:YES];
	} else if ([result integerValue] == 3) {//token认证错误
		[self showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

//override
-(void)httpError {
	[super httpError];
	[indicator stopAnimating];
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


- (void)dealloc {
	[friendId release];
    [super dealloc];
}


@end
