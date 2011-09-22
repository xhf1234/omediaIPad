//
//  HttpService.h
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@interface HttpService : BaseService {
	
}

-(NSString*) httpGet:(NSString*)url;

@end
