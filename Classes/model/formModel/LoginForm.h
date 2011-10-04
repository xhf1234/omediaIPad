//
//  LoginForm.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFormModel.h"
#import "ProValidateForm.h"

@interface LoginForm : BaseFormModel <ProValidateForm> {
	NSString* username;
	NSString* password;
	BOOL rememberPassword;
}

-(id) init;
-(void) dealloc;

@property(nonatomic, retain) NSString* username;
@property(nonatomic, retain) NSString* password;
@property(nonatomic, assign) BOOL rememberPassword;

@end
