//
//  FriendsController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-1.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "EditFriendController.h"

@interface FriendsController : BaseController {
    IBOutlet UITableView *tableView;
	UIPopoverController* popoverController;
	EditFriendController *editFriendController;

}
@end
