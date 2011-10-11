//
//  EditFriendController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupController.h"

@interface EditFriendController : PopupController {
    IBOutlet UIButton *delete;
    IBOutlet UIActivityIndicatorView *indicator;
	NSNumber* friendId;
}

@property(nonatomic, retain) NSNumber* friendId;

- (IBAction)actionDelete:(id)sender;
@end
