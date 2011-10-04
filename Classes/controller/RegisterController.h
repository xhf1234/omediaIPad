//
//  RegisterController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@class AccountService;
@class RegisterForm;

@interface RegisterController : BaseController {
    IBOutlet UITextField *confirmPassword;
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
    IBOutlet UITextField *username;
    IBOutlet UIActivityIndicatorView *indicator;
	
	RegisterForm* registerForm;
	
	AccountService* accountService;
}

-(void) dealloc;
-(id) init;

-(IBAction) actionRegister;

@end
