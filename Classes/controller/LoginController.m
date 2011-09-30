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

@implementation LoginController

@synthesize initedForm;

-(IBAction) actionRegister:(id)sender {
	RegisterController* registerController = [[RegisterController alloc] init];
	registerController.navigationItem.title = @"注册";
	[self.navigationController pushViewController:registerController animated:YES];
	[registerController release];
}
-(IBAction) actionLogin:(id)sender {
	LoginForm* form = [[LoginForm alloc] init];
	form.username = username.text;
	form.password = password.text;
	NSString* validateMsg = [form validate];
	if (validateMsg !=nil) {//前端验证失败
		[self showAlert:validateMsg buttonLabel:@"确定"];
	} else {
		[indicator startAnimating];
		[accountService login:form];
	}
	[form release];
}

-(void) loginCallback:(NSString*)json {
	[indicator stopAnimating];
	if ([json isEqualToString:@"{result:1}"]) {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:username.text forKey:@"username"];
		if ([rememberPassword isOn]) {
			[defaults setBool:YES forKey:@"rememberPassword"];
			[defaults setObject:password.text forKey:@"password"];
		} else {
			[defaults setBool:NO forKey:@"rememberPassword"];
			[defaults setObject:@"" forKey:@"password"];
		}
		MainController* mainController = [[MainController alloc]init];
		mainController.navigationItem.title = @"主菜单";
		[self changeBackTitle:@"退出"];
		[self.navigationController pushViewController:mainController animated:YES];
		[mainController release];
	} else if ([json isEqualToString:@"{result:2}"]) {
		[self showAlert:@"用户名或密码错误" buttonLabel:@"确定"];
	} else {
		[self showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

-(id) init {
	self = [super init];
	if(self) {
		accountService = [[AccountService alloc] initWithOwnerController:self];
	}
	return self;
}

//override
-(void) httpError {
	[indicator stopAnimating];
	[super httpError];
}

-(void) dealloc {
	[initedForm release];
	[accountService release];
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
	if (initedForm != nil) {
		username.text = initedForm.username;
		[rememberPassword setOn:initedForm.rememberPassword];
		if ([rememberPassword isOn]) {
			password.text = initedForm.password;
		}
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
