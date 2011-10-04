//
//  BaseService.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseController.h"

@interface BaseService : NSObject {
	//拥有该service的controller, 即该service是 ownerController的成员变量
	//因而所有service都可以访问所在的controller
	BaseController* ownerController;
}

@property(nonatomic, assign) BaseController* ownerController;

-(id) initWithOwnerController:(BaseController*)controller;

-(omediaAppDelegate*)omediatAppDelegate;

@end
