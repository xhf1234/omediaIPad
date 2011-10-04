// 
//  BaseDataModel.m
//  omedia
//
//  Created by xu hongfeng on 11-10-2.
//  Copyright 2011 THU. All rights reserved.
//

#import "BaseDataModel.h"


@implementation BaseDataModel 

@dynamic version;

-(id) init {
	self = [super init];
	if(self) {
		version = [[NSNumber alloc]initWithLong:1L];
	}
	return self;
}

-(void) dealloc {
	[version release];
	[super dealloc];
}

@end
