//
//  FriendRequestReplyForm.h
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFormModel.h"

@interface FriendRequestReplyForm : BaseFormModel {
	NSNumber* friendId;
	NSNumber* reply;
}

@property(nonatomic, retain) NSNumber* friendId;
@property(nonatomic, retain) NSNumber* reply;

@end
