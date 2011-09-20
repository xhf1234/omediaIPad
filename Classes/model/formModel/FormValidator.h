//
//  FormValidator.h
//  omedia
//
//  Created by xu hongfeng on 11-9-20.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FormValidator : NSObject {
}

+(BOOL) validateIsEmpty:(NSString*)string;
+(BOOL) validate:(NSString*)string lessThan:(int)length;
+(BOOL) validate:(NSString*)string moreThan:(int)length;
+(BOOL) validateIsAlphaOrDigit:(NSString*)string;
+(BOOL) validateIsEmail:(NSString*)string;

@end
