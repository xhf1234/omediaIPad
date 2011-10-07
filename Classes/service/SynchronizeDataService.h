//
//  SynchronizeDataService.h
//  omedia
//
//  Created by xu hongfeng on 11-10-7.
//  Copyright 2011 THU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

//与服务端同步数据的服务
@interface SynchronizeDataService : BaseService {

}

//同步数据
-(void) synchronizeData;
//启动一个间期同步数据的后台线程
-(void) startSynchronizeTimer;

@end
