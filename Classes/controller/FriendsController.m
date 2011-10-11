    //
//  FriendsController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-1.
//  Copyright 2011 THU. All rights reserved.
//

#import "FriendsController.h"
#import "omediaAppDelegate.h"
#import "Cache.h"
#import "FriendRequest.h"
#import "Friend.h"
#import "EditFriendController.h"

@implementation FriendsController


//override
-(void) reloadData {
	[super reloadData];
	[tableView reloadData];
}

//data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[self omediatAppDelegate].friendsCache.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)view cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [view dequeueReusableCellWithIdentifier:@"myfriends"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myfriends"];
		cell.detailTextLabel.lineBreakMode=UILineBreakModeWordWrap;
		cell.detailTextLabel.numberOfLines = 4;
		cell.detailTextLabel.textAlignment = UITextAlignmentLeft;
		[cell autorelease];
	}
	NSMutableArray* friends = [self omediatAppDelegate].friendsCache.dataArray;
	Friend* friend = (Friend*)[friends objectAtIndex:indexPath.row];
	cell.textLabel.text = friend.username;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"姓名:%@\nemail:%@\n电话%@\n地址:%@"
								 ,friend.realName, friend.email, friend.phone, friend.address];
	return cell;
}

//delegate
- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSMutableArray* friends = [self omediatAppDelegate].friendsCache.dataArray;
	Friend* friend = (Friend*)[friends objectAtIndex:indexPath.row];
	editFriendController.friendId = friend.accountId;
	[popoverController presentPopoverFromRect: [tv rectForRowAtIndexPath:indexPath]
									   inView:self.view
					 permittedArrowDirections:UIPopoverArrowDirectionAny
									 animated:YES];
	return indexPath;
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
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.tabBarController.navigationItem.title = @"我的好友";
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


-(id) init {
	self = [super init];
	if(self) {
		editFriendController = [[EditFriendController alloc]init];
		popoverController = [[UIPopoverController alloc] initWithContentViewController:editFriendController];
		popoverController.popoverContentSize = CGSizeMake(300,100);
		editFriendController.popoverController = popoverController;
	}
	return self;
}

-(void) dealloc {
	[popoverController release];
	[editFriendController release];
	[super dealloc];
}


@end
