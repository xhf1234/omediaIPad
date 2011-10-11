//
//  AddFriendForm.h
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFormModel.h"
#import "ProValidateForm.h"


@interface AddFriendForm : BaseFormModel <ProValidateForm> {
	NSNumber* friendId;
	NSString* msg;
}

@property(nonatomic, retain) NSNumber* friendId;
@property(nonatomic, retain) NSString* msg;

@end
