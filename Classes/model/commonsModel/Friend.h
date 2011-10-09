//
//  Friend.h
//  omedia
//
//  Created by xu hongfeng on 11-10-9.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Friend : NSObject {
	NSNumber* accountId;
	NSString* username;
	NSString* email;
	NSString* realName;
	NSString* address;
	NSString* phone;
}

@property(nonatomic, retain) NSNumber* accountId;
@property(nonatomic, retain) NSString* username;
@property(nonatomic, retain) NSString* email;
@property(nonatomic, retain) NSString* realName;
@property(nonatomic, retain) NSString* address;
@property(nonatomic, retain) NSString* phone;

-(void) dealloc;
-(id) initWithDictionary:(NSDictionary*)dictionary;

@end
