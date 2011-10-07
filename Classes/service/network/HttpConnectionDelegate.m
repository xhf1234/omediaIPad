//
//  HttpConnectionDelegate.m
//  omedia
//
//  Created by xu hongfeng on 11-9-23.
//  Copyright 2011 THU. All rights reserved.
//

#import "HttpConnectionDelegate.h"
#import "HttpService.h"

@implementation HttpConnectionDelegate

@synthesize ownerHttpService;
@synthesize receivedData;
@synthesize callback;

-(id) initWithOwnerHttpService:(HttpService*)httpService withCallback:(SEL)cb withTarget:(id)aTarget{
	self = [super init];
	if(self) {
		self.ownerHttpService = httpService;
		callback = cb;
		target = aTarget;
		receivedData = [NSMutableData data];
		[receivedData retain];
	}
	return self;
}

-(void)dealloc {
	[receivedData release];
	[super dealloc];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
	
    // This method is called when the server has determined that it
	
    // has enough information to create the NSURLResponse.
	
	
	
    // It can be called multiple times, for example in the case of a
	
    // redirect, so each time we reset the data.
	
	
	
    // receivedData is an instance variable declared elsewhere.
	
    [receivedData setLength:0];
	
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	
    // Append the new data to receivedData.
	
    // receivedData is an instance variable declared elsewhere.
	
    [receivedData appendData:data];
	
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	[target performSelector:NSSelectorFromString(@"httpError")];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSString* s = [[NSString alloc]initWithData:receivedData encoding:NSUTF8StringEncoding];
	[target performSelector:callback withObject:s];
	[s autorelease];
}

@end
