//
//  FriendRequest.h
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Friend;


@interface FriendRequest : NSObject {
	Friend* friend;
	NSString* msg;
	NSDate* time;
}
@property(nonatomic, retain) Friend* friend;
@property(nonatomic, retain) NSString* msg;
@property(nonatomic, retain) NSDate* time;


-(id) initWithFriend:(Friend *)aFriend withMsg:(NSString*)aMsg withTime:(NSDate*)aTime;
- (void) dealloc;

@end
