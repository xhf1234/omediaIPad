//
//  MainController.h
//  omedia
//
//  Created by xu hongfeng on 11-9-30.
//  Copyright 2011 THU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"


@interface MainController : BaseController {
    IBOutlet UIButton *friends;
    IBOutlet UIButton *settings;
    IBOutlet UIButton *sina;
    IBOutlet UIButton *notification;
}

- (IBAction)actionSettings:(id)sender;
- (IBAction)actionFriends:(id)sender;
- (IBAction)actionNotification:(id)sender;
@end
