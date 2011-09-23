//
//  HttpService.h
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@class HttpConnectionDelegate;
@class BaseController;

@interface HttpService : BaseService {
	
}

-(id) initWithOwnerController:(BaseController *)controller;
-(void) httpGet:(NSString *)url withTimeout:(double)timeout withCallback:(SEL)callback;

@end
