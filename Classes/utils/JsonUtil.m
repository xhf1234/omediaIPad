//
//  JsonUtil.m
//  omedia
//
//  Created by xu hongfeng on 11-10-3.
//  Copyright 2011 THU. All rights reserved.
//

#import "JsonUtil.h"
#import "SBJson.h"

@implementation JsonUtil

+ (NSDictionary*) readObject:(NSString*)jsonString {
	SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
	NSDictionary* jsonObject = [jsonParser objectWithString:jsonString];
	[jsonParser release];
	return jsonObject;
}

+ (NSString*) writeObject:(id)object {
	SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
	NSString* json = [jsonWriter stringWithObject:object];
	[jsonWriter release];
	return json;
}

@end
