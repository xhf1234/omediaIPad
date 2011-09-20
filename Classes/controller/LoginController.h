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
    IBOutlet UITextField *password;
    IBOutlet UITextField *username;
}

-(IBAction) actionLogin:(id)sender;
-(IBAction) actionRegister:(id)sender;

@end
