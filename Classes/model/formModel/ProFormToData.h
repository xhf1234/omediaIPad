//
//  FormToData.h
//  omedia
//
//  Created by xu hongfeng on 11-9-14.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseDataModel;

//表明该FormModel能转化为一个DataModel
@protocol ProFormToData

-(BaseDataModel*) toDataModel;

@end
