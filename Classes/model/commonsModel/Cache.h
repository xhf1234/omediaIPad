//
//  Cache.h
//  omedia
//
//  Created by xu hongfeng on 11-10-10.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cache : NSObject {
	NSNumber* version;
	NSMutableArray* dataArray;
}

@property(nonatomic, retain) NSNumber* version;
@property(nonatomic, retain) NSMutableArray* dataArray;

- (id)init;
- (void) dealloc;

@end
