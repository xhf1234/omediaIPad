    //
//  FriendDetailsController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-15.
//  Copyright 2011 THU. All rights reserved.
//

#import "FriendDetailsController.h"
#import "Friend.h"

@implementation FriendDetailsController

@synthesize friend;

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
	}
	return self;
}
- (void)dealloc {
	[friend release];
    [super dealloc];
}


@end
