//
//  LoginForm.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFormModel.h"
#import "ProFormToData.h"
#import "ProValidateForm.h"

@interface LoginForm : BaseFormModel <ProFormToData, ProValidateForm> {
	NSString* username;
	NSString* password;
}

@property(nonatomic, retain) NSString* username;
@property(nonatomic, retain) NSString* password;

@end
