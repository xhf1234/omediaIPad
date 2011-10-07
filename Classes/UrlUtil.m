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

@implementation UrlUtil

static NSString* omediaServerUrl = @"localhost:8080";

+(NSString*) registerUrl:(RegisterForm*)form {
	NSString* url = [NSString stringWithFormat:@"http://%@/omedia/register.do?username=%@&password=%@&email=%@",omediaServerUrl,
					 [UrlUtil urlEncode:form.username]
					 ,[UrlUtil urlEncode:form.password]
					 ,[UrlUtil urlEncode:form.email]];
	return url;
}

+(NSString*) loginUrl:(LoginForm *)form {
	NSString* url = [NSString stringWithFormat:@"http://%@/omedia/login.do?username=%@&password=%@"
					 ,omediaServerUrl
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
					  withAccountVersion:(NSNumber *)accountVersion {
	NSString* url = [NSString stringWithFormat:
					 @"http://%@/omedia/checkDataVersion.do?accountId=%@&token=%@&accountVersion=%@"
					 ,omediaServerUrl
					 ,accountId
					 ,token
					 ,accountVersion];
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
