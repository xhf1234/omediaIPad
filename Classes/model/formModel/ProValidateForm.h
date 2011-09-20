//
//  ProValidateForm.h
//  omedia
//
//  Created by xu hongfeng on 11-9-14.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>

//对一个FormModel进行前端的验证
@protocol ProValidateForm

//验证失败返回提示信息  否则返回nil
-(NSString*) validate;

@end
