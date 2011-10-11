//
//  omediaAppDelegate.h
//  omedia
//
//  Created by xu hongfeng on 11-9-12.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Cache;
@class BaseController;

@interface omediaAppDelegate : NSObject <UIApplicationDelegate> {
	//全局变量, e.g.  Service, Controller 可通过[self omediaDelegate].accountId  访问
	
    UIWindow *window;
	UINavigationController* navController;
	NSNumber* accountId;
	Cache* friendRequestCache;
	Cache* friendsCache;
	BaseController* currentController;

@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) NSNumber* accountId;
@property (nonatomic, retain) Cache* friendRequestCache;
@property (nonatomic, retain) Cache* friendsCache;
@property (nonatomic, retain) BaseController* currentController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

@end

