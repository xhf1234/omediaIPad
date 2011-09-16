//
//  omediaAppDelegate.h
//  omedia
//
//  Created by xu hongfeng on 11-9-12.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface omediaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController* navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

