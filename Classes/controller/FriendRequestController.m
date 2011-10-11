    //
//  FriendRequestController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import "FriendRequestController.h"
#import "omediaAppDelegate.h"
#import "Cache.h"
#import "FriendRequest.h"
#import "Friend.h"
#import "FriendRequestReplyController.h"
#import "FriendRequestReplyForm.h"

@implementation FriendRequestController

-(id) init {
	self = [super init];
	if(self) {
		friendRequestReplyController = [[FriendRequestReplyController alloc]init];
		popoverController = [[UIPopoverController alloc] initWithContentViewController:friendRequestReplyController];
		popoverController.popoverContentSize = CGSizeMake(300,100);
		friendRequestReplyController.popoverController = popoverController;
	}
	return self;
}

-(void) dealloc {
	[popoverController release];
	[friendRequestReplyController release];
	[super dealloc];
}

//override
-(void) reloadData {
	[super reloadData];
	
	NSMutableArray* requests = [self omediatAppDelegate].friendRequestCache.dataArray;
	NSInteger count = [requests count];
	if (count!=0) {
		self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",count];
	} else {
		self.tabBarItem.badgeValue = nil;
	}
	[tableView reloadData];
}

//data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSMutableArray* requests = [self omediatAppDelegate].friendRequestCache.dataArray;
	return [requests count];
}

- (UITableViewCell *)tableView:(UITableView *)view cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSMutableArray* requests = [self omediatAppDelegate].friendRequestCache.dataArray;
	UITableViewCell* cell = [view dequeueReusableCellWithIdentifier:@"friendRequest"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"friendRequest"];
		cell.detailTextLabel.lineBreakMode=UILineBreakModeWordWrap;
		cell.detailTextLabel.numberOfLines = 5;
		cell.detailTextLabel.textAlignment = UITextAlignmentLeft;
		[cell autorelease];
	}
	FriendRequest* request = (FriendRequest*)[requests objectAtIndex:indexPath.row];
	Friend* friend = request.friend;
	cell.textLabel.text = friend.username;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"姓名:%@\nemail:%@\n电话%@\n地址:%@\n留言:%@"
								 ,friend.realName, friend.email, friend.phone, friend.address,request.msg];
	return cell;
}

//delegate
- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSMutableArray* requests = [self omediatAppDelegate].friendRequestCache.dataArray;
	FriendRequest* request = (FriendRequest*)[requests objectAtIndex:indexPath.row];
	Friend* friend = request.friend;
	friendRequestReplyController.form.friendId = friend.accountId;
	[popoverController presentPopoverFromRect: [tv rectForRowAtIndexPath:indexPath]
									   inView:self.view
					 permittedArrowDirections:UIPopoverArrowDirectionAny
									 animated:YES];
	return indexPath;
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.tabBarController.navigationItem.title = @"好友请求";
	NSInteger count = [[self omediatAppDelegate].friendRequestCache.dataArray count];
	if (count != 0) {
		self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",count];
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


@end
