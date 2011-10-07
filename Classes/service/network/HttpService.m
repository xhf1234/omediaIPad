//
//  HttpService.m
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import "HttpService.h"
#import "HttpConnectionDelegate.h"

@implementation HttpService

-(void) httpGet:(NSString *)url withTimeout:(double)timeout withCallback:(SEL)callback withTarget:(id)target{
	HttpConnectionDelegate* delegate = [[HttpConnectionDelegate alloc]initWithOwnerHttpService:self 
																				  withCallback:callback 
																					withTarget:target];
	NSURL* nsurl = [NSURL URLWithString:url];
	NSURLRequest* request = [NSURLRequest requestWithURL:nsurl
											 cachePolicy:NSURLRequestUseProtocolCachePolicy
										 timeoutInterval:timeout]; 
	NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:request delegate:delegate];
	[conn autorelease];
	[delegate autorelease];
}

-(id) initWithOwnerController:(BaseController *)controller {
	self = [super initWithOwnerController:controller];
	if (self) {
		
	}
	return self;
}

@end
