//
//  OmediaException.m
//  omedia
//
//  Created by xu hongfeng on 11-10-4.
//  Copyright 2011 THU. All rights reserved.
//

#import "OmediaException.h"


@implementation OmediaException


//override
-(NSString*) description {
	return [NSString stringWithFormat:@"%@ : %@", [self name], [self reason]];
}

@end
