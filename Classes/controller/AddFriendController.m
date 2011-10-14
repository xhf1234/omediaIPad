    //
//  AddFriendController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import "AddFriendController.h"
#import "AddFriendForm.h"
#import "FriendsService.h"
#import "OmediaException.h"
#import "JsonUtil.h"
#import "Friend.h"


@implementation AddFriendController

@synthesize msg;
@synthesize form;
@synthesize friend;

- (IBAction)actionAddFriend:(id)sender {
	form.friendId = friend.accountId;
    form.msg = msg.text;
	[indicator startAnimating];
	@try {
		[self.friendService addFriend:form];
	}
	@catch (OmediaException * e) {
		[self showAlert:[e description] buttonLabel:@"确定"];
		[indicator stopAnimating];
	}
}

-(void) addFriendCallback:(NSString*) json {
	//停止进度条
	[indicator stopAnimating];
	//解析http返回的json数据
	//{"result":1} 请求添加好友成功
	//{"result":3} token认证失败
	//{"result":4} 不能加自己为好友
	//{"result":5} 对方已在你的好友列表中
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		[self showAlert:@"发送成功，等待好友确认." buttonLabel:@"确定"];
		[popoverController dismissPopoverAnimated:YES];
	} else if ([result integerValue] == 3) {//token认证错误
		[self showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.navigationController popToRootViewControllerAnimated:NO];
	} else if ([result integerValue] == 4) {
		[self showAlert:@"不能加自己为好友" buttonLabel:@"确定"];
	} else if ([result integerValue] == 5) {
		[self showAlert:@"对方已在您的好友列表中" buttonLabel:@"确定"];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	label.lineBreakMode=UILineBreakModeWordWrap;
	label.numberOfLines = 4;
	label.textAlignment = UITextAlignmentLeft;
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	msg.text = form.msg;
	label.text = [NSString stringWithFormat:@"姓名:%@\nemail:%@\n电话%@\n地址:%@"
				  ,friend.realName, friend.email, friend.phone, friend.address];
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


- (id)init {
	self = [super init];
	if (self) {
		form = [[AddFriendForm alloc]init];
	}
	return self;
}
- (void)dealloc {
	[friend release];
	[form release];
    [super dealloc];
}


@end
