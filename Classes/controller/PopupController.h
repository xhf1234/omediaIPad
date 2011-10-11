//
//  PopupController.h
//  omedia
//
//  Created by xu hongfeng on 11-10-11.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseController.h"

//弹出框
@interface PopupController : BaseController {
	UIPopoverController* popoverController;
}
@property(nonatomic, assign) UIPopoverController* popoverController;

- (id)init;
- (void) dealloc;

@end
