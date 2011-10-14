//
//  SocialGraphController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-14.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@class AddFriendController;
@class UIPopoverController;
@class FriendDetailsController;

@interface SocialGraphController : BaseController {
    IBOutlet UIWebView *webView;
	AddFriendController* addFriendController;
	FriendDetailsController* friendDetailsController;
	UIPopoverController* popoverController;
}

- (id)init;
- (void) dealloc;

@end
