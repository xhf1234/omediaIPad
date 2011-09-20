//
//  FormValidator.m
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import "FormValidator.h"

//正则表达式   字母或数字
static NSString* Reg_Alpha_Digit = @"[a-zA-Z0-9]*"; 
static NSString* Reg_Email = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

@implementation FormValidator

+(BOOL) validateIsEmpty:(NSString*)string {
	return [string isEqualToString:@""];
}

+(BOOL) validate:(NSString*)string lessThan:(int)length {
	return [string length] < length;
}

+(BOOL) validate:(NSString*)string moreThan:(int)length {
	return [string length] > length;
}

+(BOOL) validateIsAlphaOrDigit:(NSString*)string {
	NSPredicate *alphaDigitTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Reg_Alpha_Digit];
	return [alphaDigitTest evaluateWithObject:string];
}

+(BOOL) validateIsEmail:(NSString*)string {
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Reg_Email];
	return [emailTest evaluateWithObject:string];
}

@end
