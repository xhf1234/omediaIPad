//
//  CoreDataException.h
//  omedia
//
//  Created by xu hongfeng on 11-10-4.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OmediaException.h"

@interface CoreDataException : OmediaException {

}

+ (CoreDataException*) exceptionWithReason:(NSString *)reason;

@end
