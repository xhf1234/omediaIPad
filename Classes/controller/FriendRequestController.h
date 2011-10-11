//
//  FriendRequestController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@class FriendRequestReplyController;

@interface FriendRequestController : BaseController {
    IBOutlet UITableView *tableView;
	FriendRequestReplyController* friendRequestReplyController;
	UIPopoverController* popoverController;
}

- (id)init;
- (void) dealloc;


@end
