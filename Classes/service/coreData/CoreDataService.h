//
//  CoreDataService.h
//  omedia
//
//  Created by xu hongfeng on 11-10-4.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@class Account;
@class NSManagedObjectContext;

@interface CoreDataService : BaseService {
	NSManagedObjectContext* context;
}

- (id)initWithOwnerController:(BaseController *)controller;
- (void)dealloc;

- (Account*) getAccountWithId:(NSNumber*)accountId;
- (Account*) createAccountWithId:(NSNumber*)accountId withUserName:(NSString*)username withToken:(NSNumber*)token;

- (void) saveContext;

@end
