//
//  AccountController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@class SettingForm;

@interface SettingController : BaseController {
    IBOutlet UITextField *address;
    IBOutlet UITextField *confirmPassword;
    IBOutlet UITextField *email;
    IBOutlet UITextField *newPassword;
    IBOutlet UITextField *oldPassword;
    IBOutlet UITextField *phone;
    IBOutlet UITextField *realName;
    IBOutlet UIActivityIndicatorView *indicator;
	SettingForm* settingForm;
}
- (IBAction)actionSaveSetting:(id)sender;

- (id)init;
- (void) dealloc;

-(void) settingCallback:(NSString*)json;

@end
