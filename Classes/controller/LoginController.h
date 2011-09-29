//
//  LoginController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "LoginForm.h";

@class AccountService;

@interface LoginController : BaseController {
    IBOutlet UITextField *password;
    IBOutlet UITextField *username;
    IBOutlet UIActivityIndicatorView *indicator;
    IBOutlet UISwitch *rememberPassword;
	AccountService* accountService;
	LoginForm* initedForm;
}

@property(nonatomic, retain) LoginForm* initedForm;

-(IBAction) actionLogin:(id)sender;
-(IBAction) actionRegister:(id)sender;

-(void) dealloc;
-(id) init;

@end
