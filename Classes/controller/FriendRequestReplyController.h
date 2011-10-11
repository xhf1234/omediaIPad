//
//  FriendRequestReplyController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupController.h"

@class FriendRequestReplyForm;

@interface FriendRequestReplyController : PopupController {
    IBOutlet UIButton *agree;
    IBOutlet UIButton *reject;
    IBOutlet UIActivityIndicatorView *indicator;
	FriendRequestReplyForm* form;
}

@property(nonatomic, retain) FriendRequestReplyForm* form;

- (IBAction)actionAgree:(id)sender;
- (IBAction)actionReject:(id)sender;

- (id)init;
- (void) dealloc;


@end
