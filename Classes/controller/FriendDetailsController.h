//
//  FriendDetailsController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-15.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupController.h"

@class Friend;

@interface FriendDetailsController : PopupController {
    IBOutlet UILabel *label;
	Friend* friend;
}

@property(nonatomic, retain) Friend* friend;

- (id)init;
- (void) dealloc;

@end
