//
//  Account.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataModel.h"

@interface Account : BaseDataModel {
	NSString* username;
	NSString* password;
	NSString* email;
}

@property(nonatomic, retain) NSString* username;
@property(nonatomic, retain) NSString* password;
@property(nonatomic, retain) NSString* email;

@end
