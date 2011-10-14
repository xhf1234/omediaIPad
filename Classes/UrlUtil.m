//
//  UrlUtil.m
//  omedia
//
//  Created by xu hongfeng on 11-10-6.
//  Copyright 2011 THU. All rights reserved.
//

#import "UrlUtil.h"
#import "RegisterForm.h"
#import "LoginForm.h"
#import "SettingForm.h"
#import "FriendRequestReplyForm.h"

@implementation UrlUtil

//static NSString* omediaServerUrl = @"localhost:8080";
static NSString* omediaServerUrl = @"166.111.137.72:10086";

static NSString* omediaVersion = @"0.3";

+(NSString*) registerUrl:(RegisterForm*)form {
	NSString* url = [NSString stringWithFormat:@"http://%@/omedia/register.do?omediaVersion=%@&username=%@&password=%@&email=%@"
					 ,omediaServerUrl
					 ,omediaVersion
					 ,[UrlUtil urlEncode:form.username]
					 ,[UrlUtil urlEncode:form.password]
					 ,[UrlUtil urlEncode:form.email]];
	return url;
}

+(NSString*) loginUrl:(LoginForm *)form {
	NSString* url = [NSString stringWithFormat:@"http://%@/omedia/login.do?omediaVersion=%@&username=%@&password=%@"
					 ,omediaServerUrl
					 ,omediaVersion
					 ,[UrlUtil urlEncode:form.username]
					 ,[UrlUtil urlEncode:form.password]];
	return url;
}

+(NSString*) settingUrl:(SettingForm *)form withAccountId:(NSNumber *)accountId withToken:(NSNumber *)token {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/setting.do?accountId=%@&token=%@&oldPassword=%@&newPassword=%@&email=%@&realName=%@&phone=%@&address=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,[UrlUtil urlEncode:form.oldPassword]
					 ,[UrlUtil urlEncode:form.newPassword]
					 ,[UrlUtil urlEncode:form.email]
					 ,[UrlUtil urlEncode:form.realName]
					 ,[UrlUtil urlEncode:form.phone]
					 ,[UrlUtil urlEncode:form.address]];
	return url;
}

+(NSString*) checkDataVersionUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token 
						   withAccountVersion:(NSNumber *)accountVersion 
						   withFriendRequestVersion:(NSNumber*)friendRequestVersion
						   withFriendsVersion:(NSNumber*)friendsVersion {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/checkDataVersion.do?accountId=%@&token=%@&accountVersion=%@&friendRequestVersion=%@&friendsVersion=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,accountVersion
					 ,friendRequestVersion
					 ,friendsVersion];
	return url;
}

+(NSString*) getAccountUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/getAccount.do?accountId=%@&token=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token];
	return url;
}

+(NSString*) getFriendRequestUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/getFriendRequest.do?accountId=%@&token=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token];
	return url;
}


+(NSString*) searchFriendsUrlWithAccountId:(NSNumber *)accountId 
								 withToken:(NSNumber *)token 
							   withKeyword:(NSString *)keyword {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/searchFriends.do?accountId=%@&token=%@&keyword=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,[UrlUtil urlEncode:keyword]];
	return url;
}

+(NSString*) addFriendUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token 
						  withFriendId:(NSNumber*) friendId withMsg:(NSString*)msg {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/addFriend.do?accountId=%@&token=%@&friendId=%@&msg=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,friendId
					 ,[UrlUtil urlEncode:msg]];
	return url;
}

+(NSString*) friendRequestReplyUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token 
									   withForm:(FriendRequestReplyForm *)form {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/friendRequestReply.do?accountId=%@&token=%@&friendId=%@&reply=%d"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,form.friendId
					 ,[form.reply intValue]];
	return url;
}

+(NSString*) getFriendsWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/getFriends.do?accountId=%@&token=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token];
	return url;
}

+(NSString*) deleteFriendsUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token withFriendId:(NSNumber *)friendId {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/deleteFriends.do?accountId=%@&token=%@&friendId=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,friendId];
	return url;
}

+(NSString*) socialGraphUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/socialGraph.do?accountId=%@&token=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token];
	return url;
}


+(NSString*) urlEncode:(NSString *)string {
	NSString *result = (NSString *)
	CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
											(CFStringRef)string,
											NULL,
											CFSTR("!*'();:@&amp;=+$,/?%#[] "),
											kCFStringEncodingUTF8);
	[result autorelease];
	return result;
}

@end
