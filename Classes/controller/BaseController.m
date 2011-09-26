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
	UIBarButtonItem* back = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
	[back release];
}

-(void) httpError {
	[self showAlert:@"网络错误" buttonLabel:@"确定"];
}

-(void) showAlert:(NSString*)message buttonLabel:(NSString*)buttonLabel {
	UIAlertView *alertDialog = [[UIAlertView alloc] initWithTitle:nil 
														  message:message
														 delegate:nil
												cancelButtonTitle:buttonLabel
												otherButtonTitles:nil];
    [alertDialog show];
    [alertDialog release];
}

@end
