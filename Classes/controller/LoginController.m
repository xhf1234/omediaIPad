    //
//  LoginController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import "LoginController.h"
#import "RegisterController.h"
#import "LoginForm.h"
#import "AccountService.h"
#import "SettingController.h"
#import "MainController.h"
#import "JsonUtil.h"
#import "CoreDataService.h"
#import "Account.h"
#import "CoreDataException.h"
#import "omediaAppDelegate.h"
#import "SynchronizeDataService.h"

@implementation LoginController

-(IBAction) actionRegister:(id)sender {
	RegisterController* registerController = [[RegisterController alloc] init];
	registerController.navigationItem.title = @"注册";
	[self.navigationController pushViewController:registerController animated:YES];
	[registerController release];
}
-(IBAction) actionLogin:(id)sender {
	loginForm.username = username.text;
	loginForm.password = password.text;
	NSString* validateMsg = [loginForm validate];
	if (validateMsg !=nil) {//前端验证失败
		[self showAlert:validateMsg buttonLabel:@"确定"];
	} else {
		[indicator startAnimating];
		[accountService login:loginForm];
	}
}

//http登陆请求的回调函数
-(void) loginCallback:(NSString*)json {
	//停止进度条
	[indicator stopAnimating];
	//解析http返回的json数据
	//{"result":1,"token",long} 登陆成功
	//{"result":2} 密码错误
	//{"result":4} omedia版本过低
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if ([result integerValue] == 1) {//登陆成功
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		//记住用户名
		[defaults setObject:username.text forKey:@"username"];
		if ([rememberPassword isOn]) {//记住密码
			[defaults setBool:YES forKey:@"rememberPassword"];
			[defaults setObject:password.text forKey:@"password"];
		} else {//不记住密码
			[defaults setBool:NO forKey:@"rememberPassword"];
			[defaults setObject:@"" forKey:@"password"];
		}
		//save core data
		@try {
			NSNumber* accountId = [jsonObject valueForKey:@"accountId"];
			[self omediatAppDelegate].accountId = accountId;
			NSNumber* token = [jsonObject valueForKey:@"token"];
			Account* account = [coreDataService getAccountWithId:accountId];
			if (account == nil) {
				account = [coreDataService createAccountWithId:accountId 
												  withUserName:loginForm.username
													 withToken:token];
			}
			account.token = token;
			[coreDataService saveContext];
		}
		@catch (CoreDataException * e) {
			[self showAlert:[e description] buttonLabel:@"确定"];
		}
		//同步客户端数据
		[self.syncService synchronizeData];
		//启动后台间期执行任务的进程
		[self.syncService startSynchronizeTimer];
		//跳转到主菜单
		MainController* mainController = [[MainController alloc]init];
		mainController.navigationItem.title = @"主菜单";
		[self changeBackTitle:@"退出"];
		[self.navigationController pushViewController:mainController animated:YES];
		[mainController release];
	} else if ([result integerValue] == 2) {//密码错误
		[self showAlert:@"用户名或密码错误" buttonLabel:@"确定"];
	} else if ([result integerValue] == 4) {//客户端版本过低
		[self showAlert:@"请升级omedia至最新版本" buttonLabel:@"确定"];
	} else {//服务器错误
		[self showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

-(id) init {
	self = [super init];
	if(self) {
		loginForm = [[LoginForm alloc] init];
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		loginForm.username = [defaults stringForKey:@"username"];
		loginForm.rememberPassword = [defaults boolForKey:@"rememberPassword"];
		if (loginForm.rememberPassword) {
			loginForm.password = [defaults stringForKey:@"password"];
		} else {
			loginForm.password = @"";
		}
	}
	return self;
}

//override
- (void)viewWillAppear:(BOOL)animated {
	[self omediatAppDelegate].accountId = 0;
	[super viewWillAppear:animated];
}

//override
-(void) httpError {
	[indicator stopAnimating];
	[super httpError];
}

-(void) dealloc {
	[loginForm release];
	[indicator release];
	[username release];
	[password release];
	[super dealloc];
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
	username.text = loginForm.username;
	[rememberPassword setOn:loginForm.rememberPassword];
	if ([rememberPassword isOn]) {
		password.text = loginForm.password;
	}
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



@end
