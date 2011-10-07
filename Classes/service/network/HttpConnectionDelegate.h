//
//  HttpConnectionDelegate.h
//  omedia
//
//  Created by xu hongfeng on 11-9-23.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HttpService;

@interface HttpConnectionDelegate : NSObject {
	NSMutableData* receivedData;
	HttpService* ownerHttpService;
	SEL callback;
	id target;
}

@property(nonatomic, assign) HttpService* ownerHttpService;
@property(nonatomic, retain) NSMutableData* receivedData;
@property(nonatomic, assign) SEL callback;
@property(nonatomic, retain) id target;

-(void)dealloc;
-(id) initWithOwnerHttpService:(HttpService*)httpService withCallback:(SEL)cb;

//delegate method for NSURLConnecton
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
@end
