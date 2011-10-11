//
//  BaseController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>


@class omediaAppDelegate;

@class AccountService;
@class CoreDataService;
@class HttpService;
@class SynchronizeDataService;
@class FriendsService;

@interface BaseController : UIViewController {
	AccountService* accountService;
	CoreDataService* coreDataService;
	HttpService* httpService;
	SynchronizeDataService* syncService;
	FriendsService* friendService;
}

@property(nonatomic, retain) AccountService* accountService;
@property(nonatomic, retain) CoreDataService* coreDataService;
@property(nonatomic, retain) HttpService* httpService;
@property(nonatomic, retain) SynchronizeDataService* syncService;
@property(nonatomic, retain) FriendsService* friendService;

-(void) dealloc;
-(id) init;

//导航返回
- (void) back;
//改变返回按钮的标题
- (void) changeBackTitle:(NSString*)title;
//显示alert
-(void) showAlert:(NSString*)message buttonLabel:(NSString*)buttonLabel;
//http请求出错，弹出错误提示框
-(void) httpError;
//重新加载界面数据
-(void) reloadData;

-(omediaAppDelegate*)omediatAppDelegate;

@end
