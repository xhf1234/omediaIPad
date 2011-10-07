//
//  LoginController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-16.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@class LoginForm;

@interface LoginController : BaseController {
    IBOutlet UITextField *password;
    IBOutlet UITextField *username;
    IBOutlet UIActivityIndicatorView *indicator;
    IBOutlet UISwitch *rememberPassword;
	LoginForm* loginForm;
}

-(IBAction) actionLogin:(id)sender;
-(IBAction) actionRegister:(id)sender;

-(void) loginCallback:(NSString*)json;

-(void) dealloc;
-(id) init;

@end
