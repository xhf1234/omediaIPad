//
//  AccountService.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@class RegisterForm;
@class LoginForm;

@interface AccountService : BaseService {

}

//注册一个账户
//成功返回1
//用户名已存在返回0
+(int) regester:(RegisterForm*)form;

//登陆
//成功返回1
//失败返回0
+(int) login:(LoginForm*)form;

@end
