    //
//  MainController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-30.
//  Copyright 2011 THU. All rights reserved.
//

#import "MainController.h"
#import "SettingController.h"
#import "FriendsController.h"
#import "SearchFriendsController.h"
#import "omediaAppDelegate.h"

@implementation MainController
- (IBAction)actionSettings:(id)sender {
	SettingController* settingController = [[SettingController alloc]init];
	settingController.navigationItem.title = @"设置";
    [self.navigationController pushViewController:settingController animated:YES];
	[settingController release];
}

- (IBAction)actionFriends:(id)sender {
	UITabBarController* tabController = [[UITabBarController alloc] init];
	FriendsController* friendsController = [[FriendsController alloc]init];
	SearchFriendsController* searchFriendsController = [[SearchFriendsController alloc]init];
	tabController.viewControllers = [NSArray arrayWithObjects: friendsController, searchFriendsController ,nil];
	friendsController.tabBarItem.title = @"我的好友";
	searchFriendsController.tabBarItem.title = @"搜索好友";
    [self.navigationController pushViewController:tabController animated:YES];
	[friendsController release];
	[searchFriendsController release];
	[tabController release];
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
	[friends release];
	[settings release];
	[sina release];
    [super dealloc];
}


@end
