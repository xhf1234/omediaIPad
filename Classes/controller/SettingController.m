    //
//  AccountController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import "SettingController.h"


@implementation SettingController

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
		//TODO
	}

}

- (id) init {
	self = [super init];
	if(self) {
		settingForm = [[SettingForm alloc]init];
		//TODO
	}
	return self;
}

- (void) dealloc
{
	[settingForm release];
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
