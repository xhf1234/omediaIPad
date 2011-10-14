//
//  UrlUtil.h
//  omedia
//
//  Created by xu hongfeng on 11-10-6.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RegisterForm;
@class LoginForm;
@class SettingForm;
@class FriendRequestReplyForm;

@interface UrlUtil : NSObject {

}

+(NSString*) registerUrl:(RegisterForm*)form;
+(NSString*) loginUrl:(LoginForm*)form;
+(NSString*) settingUrl:(SettingForm*)form withAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;
+(NSString*) checkDataVersionUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token 
					  withAccountVersion:(NSNumber *)accountVersion
					  withFriendRequestVersion:(NSNumber*)friendRequestVersion
					  withFriendsVersion:(NSNumber*)friendsVersion;
+(NSString*) getAccountUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;
+(NSString*) getFriendRequestUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;
+(NSString*) searchFriendsUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token withKeyword:(NSString*)keyword;
+(NSString*) addFriendUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token 
						  withFriendId:(NSNumber*) friendId withMsg:(NSString*)msg;
+(NSString*) friendRequestReplyUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token 
						withForm:(FriendRequestReplyForm*)form;
+(NSString*) getFriendsWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;
+(NSString*) deleteFriendsUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token
									withFriendId:(NSNumber*)friendId;
+(NSString*) socialGraphUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;

+(NSString*) urlEncode:(NSString*)string;

@end
