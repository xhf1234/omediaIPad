//
//  AddFriendController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "PopupController.h"

@class AddFriendForm;
@class Friend;

@interface AddFriendController : PopupController {
    IBOutlet UITextField *msg;
    IBOutlet UIActivityIndicatorView *indicator;
    IBOutlet UILabel *label;
	AddFriendForm* form;
	Friend* friend;
}

@property(nonatomic, retain) UITextField *msg;
@property(nonatomic, retain) AddFriendForm* form;
@property(nonatomic, retain) Friend* friend;

- (id)init;
- (void) dealloc;

- (IBAction)actionAddFriend:(id)sender;
@end
