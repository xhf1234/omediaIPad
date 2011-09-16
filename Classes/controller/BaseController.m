//
//  BaseController.m
//  omedia
//
//  Created by xu hongfeng on 11-9-13.
//  Copyright 2011 THU. All rights reserved.
//

#import "BaseController.h"


@implementation BaseController

- (void) back {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void) changeBackTitle:(NSString *)title {
	UIBarButtonItem* back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = back;
	[back release];
}

@end
