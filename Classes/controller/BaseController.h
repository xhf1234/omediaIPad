//
//  BaseController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController {

}

//导航返回
- (void) back;
//改变返回按钮的标题
- (void) changeBackTitle:(NSString*)title;

@end
