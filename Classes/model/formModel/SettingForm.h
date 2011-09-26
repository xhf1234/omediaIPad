//
//  SettingForm.h
//  omedia
//
//  Created by xu hongfeng on 11-9-26.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFormModel.h"
#import "ProValidateForm.h"

@interface SettingForm : BaseFormModel <ProValidateForm> {
	NSString* oldPassword;
	NSString* newPassword;
	NSString* confirmPassword;
	NSString* email;
	NSString* realName;
	NSString* phone;
	NSString* address;
}

@property(nonatomic, retain) NSString* oldPassword;
@property(nonatomic, retain) NSString* newPassword;
@property(nonatomic, retain) NSString* confirmPassword;
@property(nonatomic, retain) NSString* email;
@property(nonatomic, retain) NSString* realName;
@property(nonatomic, retain) NSString* phone;
@property(nonatomic, retain) NSString* address;

@end
