    //
//  RegisterController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import "RegisterController.h"
#import "RegisterForm.h"


@implementation RegisterController

-(IBAction) actionRegister {
	RegisterForm* form = [[RegisterForm alloc] init];
	form.username = username.text;
	form.password = password.text;
	form.confirmPassword = confirmPassword.text;
	form.email = email.text;
	NSString* validateMsg = [form validate];
	if (validateMsg != nil) {
		[self showAlert:validateMsg buttonLabel:@"确定"];
	}
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
	[username release];
	[password release];
	[confirmPassword release];
	[email release];
    [super dealloc];
}


@end
