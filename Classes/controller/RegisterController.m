    //
//  RegisterController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import "RegisterController.h"
#import "RegisterForm.h"
#import "AccountService.h"
#import "JsonUtil.h"
#import "omediaAppDelegate.h"
#import "Account.h"

@implementation RegisterController

-(IBAction) actionRegister {
	registerForm.username = username.text;
	registerForm.password = password.text;
	registerForm.confirmPassword = confirmPassword.text;
	registerForm.email = email.text;
	NSString* validateMsg = [registerForm validate];
	if (validateMsg != nil) {
		[self showAlert:validateMsg buttonLabel:@"确定"];
	} else {
		[indicator startAnimating];
		[accountService regester:registerForm];
	}
}

-(void) dealloc {
	[registerForm release]; 
	[indicator release];
	[username release];
	[password release];
	[confirmPassword release];
	[email release];
	[super dealloc];
}

-(id) init {
	self = [super init];
	if(self) {
		registerForm = [[RegisterForm alloc]init];
	}
	return self;
}

//注册账户 http请求的回调函数
-(void) registerCallback:(NSString*)json {
	//停止进度条
	[indicator stopAnimating];
	//解析服务端返回的json数据
	//{"result":1, "accountId",long} 注册成功
	//"{result":2} 用户名已经被注册
	//{"result":4} omedia版本过低
	//"{result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if ([result integerValue] == 1) {
		[self showAlert:@"注册成功" buttonLabel:@"确定"];
		[self.navigationController popViewControllerAnimated:YES];
	} else if ([result integerValue] == 2) {
		[self showAlert:@"该用户名已被注册" buttonLabel:@"确定"];
	} else if ([result integerValue] == 4) {//客户端版本过低
		[self showAlert:@"请升级omedia至最新版本" buttonLabel:@"确定"];
	} else {
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



@end
