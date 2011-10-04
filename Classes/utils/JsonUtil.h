//
//  JsonUtil.h
//  omedia
//
//  Created by xu hongfeng on 11-10-3.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JsonUtil : NSObject {
	
}

+ (NSDictionary*) readObject:(NSString*)jsonString;

@end
