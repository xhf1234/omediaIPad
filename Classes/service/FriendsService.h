//
//  FriendsService.h
//  omedia
//
//  Created by xu hongfeng on 11-10-8.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@class AddFriendForm;
@class FriendRequestReplyForm;
/**
 *  关于”好友“操作的接口
 *
 **/
@interface FriendsService : BaseService {

}

-(void) searchFriends:(NSString*)keyword;
-(void) addFriend:(AddFriendForm*)form;
-(void) friendRequestReply:(FriendRequestReplyForm*)form;
-(void) deleteFriend:(NSNumber*)friendId;

@end
