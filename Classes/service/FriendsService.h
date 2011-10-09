//
//  FriendsService.h
//  omedia
//
//  Created by xu hongfeng on 11-10-8.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

/**
 *  关于”好友“操作的接口
 *
 **/
@interface FriendsService : BaseService {

}

-(void) searchFriends:(NSString*)keyword;

@end
