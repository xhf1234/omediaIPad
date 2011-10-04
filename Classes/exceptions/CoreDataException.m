//
//  CoreDataException.m
//  omedia
//
//  Created by xu hongfeng on 11-10-4.
//  Copyright 2011 THU. All rights reserved.
//

#import "CoreDataException.h"


@implementation CoreDataException

+ (CoreDataException*) exceptionWithReason:(NSString *)reason {
	CoreDataException* exception = [[CoreDataException alloc] initWithName:@"CoreDataException"
								reason:reason userInfo:nil];
	[exception autorelease];
	return exception;
}

@end
