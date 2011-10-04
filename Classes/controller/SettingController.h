//
//  AccountController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "SettingForm.h"

@interface SettingController : BaseController {
    IBOutlet UITextField *address;
    IBOutlet UITextField *confirmPassword;
    IBOutlet UITextField *email;
    IBOutlet UITextField *newPassword;
    IBOutlet UITextField *oldPassword;
    IBOutlet UITextField *phone;
    IBOutlet UITextField *realName;
	SettingForm* settingForm;
}
- (IBAction)actionSaveSetting:(id)sender;

- (id)init;
- (void) dealloc;

@end
