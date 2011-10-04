//
//  Account.h
//  omedia
//
//  Created by xu hongfeng on 11-10-2.
//  Copyright 2011 THU. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "BaseDataModel.h"


@interface Account :  BaseDataModel  
{
}

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * realName;
@property (nonatomic, retain) NSNumber * accountId;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSNumber * token;

@end



