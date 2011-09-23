//
//  BaseService.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "BaseService.h"
#import "BaseController.h"

@implementation BaseService
	
@synthesize ownerController;

-(id) initWithOwnerController:(BaseController *)controller {
	self = [super init];
	if(self) {
		self.ownerController = controller;
	}
	return self;
}

@end
