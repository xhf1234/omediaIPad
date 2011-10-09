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

@interface UrlUtil : NSObject {

}

+(NSString*) registerUrl:(RegisterForm*)form;
+(NSString*) loginUrl:(LoginForm*)form;
+(NSString*) settingUrl:(SettingForm*)form withAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;
+(NSString*) checkDataVersionUrlWithAccountId:(NSNumber *)accountId withToken:(NSNumber *)token 
					  withAccountVersion:(NSNumber *)accountVersion;
+(NSString*) getAccountUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token;
+(NSString*) searchFriendsUrlWithAccountId:(NSNumber*)accountId withToken:(NSNumber*)token withKeyword:(NSString*)keyword;

+(NSString*) urlEncode:(NSString*)string;

@end
