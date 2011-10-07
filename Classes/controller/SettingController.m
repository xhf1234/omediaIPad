    //
//  AccountController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import "SettingController.h"
#import "CoreDataService.h"
#import "omediaAppDelegate.h"
#import "SettingForm.h"
#import "Account.h"
#import "JsonUtil.h"
#import "CoreDataException.h"
#import "AccountService.h"

@implementation SettingController

-(void) settingCallback:(NSString*)json {
	//停止进度条
	[indicator stopAnimating];
	//解析http返回的json数据
	//{"result":1,"version",long} 修改账户信息成功
	//{"result":2} 密码错误
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		//保存数据
		@try {
			NSNumber* version = [jsonObject valueForKey:@"version"];
			NSNumber* accountId = [self omediatAppDelegate].accountId;
			Account* account = [coreDataService getAccountWithId:accountId];
			account.email = settingForm.email;
			account.realName = settingForm.realName;
			account.phone = settingForm.phone;
			account.address = settingForm.address;
			account.version = version;
			[coreDataService saveContext];
			[self showAlert:@"修改成功" buttonLabel:@"确定"];
			[self.navigationController popViewControllerAnimated:YES];
		}
		@catch (CoreDataException * e) {
			[self showAlert:[e description] buttonLabel:@"确定"];
		}
	} else if ([result integerValue] == 2) {//密码错误
		[self showAlert:@"密码错误" buttonLabel:@"确定"];
	} else if ([result integerValue] == 3) {//token认证错误
		[self showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

- (IBAction)actionSaveSetting:(id)sender {
	settingForm.oldPassword = oldPassword.text;
	settingForm.newPassword = newPassword.text;
	settingForm.confirmPassword = confirmPassword.text;
	settingForm.email = email.text;
	settingForm.realName = realName.text;
	settingForm.phone = phone.text;
	settingForm.address = address.text;
	NSString* validateMsg = [settingForm validate];
	if (validateMsg != nil) {
		[self showAlert:validateMsg buttonLabel:@"确定"];
	} else {
		[indicator stopAnimating];
		[accountService setting:settingForm];
	}

}

- (id) init {
	self = [super init];
	if(self) {
		NSNumber* accountId = [self omediatAppDelegate].accountId;
		Account* account = [coreDataService getAccountWithId:accountId];
		settingForm = [[SettingForm alloc]init];
		settingForm.email = account.email;
		settingForm.realName = account.realName;
		settingForm.address = account.address;
		settingForm.phone = account.phone;
	}
	return self;
}

//override
-(void) httpError {
	[indicator stopAnimating];
	[super httpError];
}

- (void) dealloc
{
	[settingForm release];
	[indicator release];
	[oldPassword release];
	[newPassword release];
	[confirmPassword release];
	[email release];
	[realName release];
	[phone release];
	[address release];
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
	self.tabBarController.navigationItem.title = @"设置";
	oldPassword.text = settingForm.oldPassword;
	newPassword.text = settingForm.newPassword;
	confirmPassword.text = settingForm.confirmPassword;
	email.text = settingForm.email;
	realName.text = settingForm.realName;
	phone.text = settingForm.phone;
	address.text = settingForm.address;
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
