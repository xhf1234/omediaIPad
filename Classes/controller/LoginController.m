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

@implementation LoginController

-(IBAction) actionRegister:(id)sender {
	RegisterController* registerController = [[RegisterController alloc] init];
	registerController.navigationItem.title = @"注册";
	[self changeBackTitle:@"返回"];
	[self.navigationController pushViewController:registerController animated:YES];
	[registerController release];
}
-(IBAction) actionLogin:(id)sender {
	LoginForm* form = [[LoginForm alloc] init];
	form.username = username.text;
	form.password = password.text;
	NSString* validateMsg = [form validate];
	[validateMsg retain];
	if (validateMsg !=nil) {//前端验证失败
		[self showAlert:validateMsg buttonLabel:@"确定"];
		return;
	}
	int r = [AccountService login:form];
	if (r==0) {//账号或密码错误
		[self showAlert:@"账号或密码错误" buttonLabel:@"确定"];
		return;
	}
	UITabBarController* tabController = [[UITabBarController alloc] init];
	UIViewController* v1 = [[UIViewController alloc] init];
	UIViewController* v2 = [[UIViewController alloc] init];
	tabController.viewControllers = [NSArray arrayWithObjects:v1, v2, nil];
	[v1 release];
	[v2 release];
	tabController.navigationItem.title = @"主菜单";
	[self changeBackTitle:@"退出"];
	[self.navigationController pushViewController:tabController animated:YES];
	
	
	[form autorelease];
	[validateMsg release];
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
    [super dealloc];
}


@end
