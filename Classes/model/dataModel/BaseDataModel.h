//
//  BaseDataModel.h
//  omedia
//
//  Created by xu hongfeng on 11-10-2.
//  Copyright 2011 THU. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface BaseDataModel :  NSManagedObject  
{
	NSNumber * version;
}

@property (nonatomic, retain) NSNumber * version;

-(id) init;
-(void) dealloc;

@end



