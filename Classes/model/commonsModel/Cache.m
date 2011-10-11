//
//  Cache.m
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import "Cache.h"


@implementation Cache

@synthesize version;
@synthesize dataArray;

- (id)init {
	self = [super init];
	if(self) {
		version = [[NSNumber alloc]initWithLong:0L];
		dataArray = [[NSMutableArray alloc]initWithCapacity:32];
	}
	return self;
}

- (void) dealloc {
	[version release];
	[dataArray release];
	[super dealloc];
}

@end
