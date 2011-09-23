//
//  AccountService.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "HttpService.h"

@class RegisterForm;
@class LoginForm;
@class BaseController;

@interface AccountService : BaseService {
	HttpService* httpService;
}

-(id) initWithOwnerController:(BaseController *)controller;
-(void) dealloc;

-(void) regester:(RegisterForm*)form;

//登陆
//成功返回1
//失败返回0
-(int) login:(LoginForm*)form;

@end
