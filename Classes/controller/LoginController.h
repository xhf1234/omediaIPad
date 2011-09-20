//
//  LoginController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@interface LoginController : BaseController {
	IBOutlet UITextField* username;
	IBOutlet UITextField* password;
}

-(IBAction) actionLogin:(id)sender;
-(IBAction) actionRegister:(id)sender;

@end
