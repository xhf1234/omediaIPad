    //
//  SearchFriendsController.m
//  omedia
//
//  Created by xu hongfeng on 11-10-8.
//  Copyright 2011 THU. All rights reserved.
//

#import "SearchFriendsController.h"
#import "FriendsService.h"
#import "JsonUtil.h"
#import "OmediaException.h"
#import "Friend.h"

@implementation SearchFriendsController

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSString* keyword = searchBar.text;
	if ([keyword length] == 0) {
		return;
	}
	[indicator startAnimating];
	@try {
		[friendService searchFriends:keyword];
	}
	@catch (OmediaException* e) {
		[indicator stopAnimating];
		[self showAlert:[e description] buttonLabel:@"确定"];
	}
}

-(void) searchFriendsCallback:(NSString*)json {
	//停止进度条
	[indicator stopAnimating];
	//解析http返回的json数据
	//{"result":1,"friends",json array} 成功获得搜索结果
	//{"result":3} token认证失败
	//{"result":-1} 服务器错误
	NSDictionary* jsonObject = [JsonUtil readObject:json];
	NSNumber* result = [jsonObject valueForKey:@"result"];
	if([result integerValue] == 1) {
		@try {
			NSArray* datas = [jsonObject valueForKey:@"friends"];
			[friends removeAllObjects];
			for (NSDictionary* e in datas) {
				Friend* friend = [[Friend alloc]initWithDictionary:e];
				[friends addObject:friend];
			}
			[tableView reloadData];
		}
		@catch (OmediaException * e) {
			[self showAlert:[e description] buttonLabel:@"确定"];
		}
	} else if ([result integerValue] == 3) {//token认证错误
		[self showAlert:@"token认证失败,请重新登陆" buttonLabel:@"确定"];
		[self.navigationController popToRootViewControllerAnimated:NO];
	} else {//服务器错误
		[self showAlert:@"服务器错误" buttonLabel:@"确定"];
	}
}

-(id) init {
	self = [super init];
	if(self) {
		friends = [[NSMutableArray alloc]initWithCapacity:32];
	}
	return self;
}

-(void) dealloc {
	[friends release];
	[super dealloc];
}

//data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [friends count];
}

- (UITableViewCell *)tableView:(UITableView *)view cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [view dequeueReusableCellWithIdentifier:@"searchFriends"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"searchFriends"];
		cell.detailTextLabel.lineBreakMode=UILineBreakModeWordWrap;
		cell.detailTextLabel.numberOfLines = 4;
		cell.detailTextLabel.textAlignment = UITextAlignmentLeft;
		[cell autorelease];
	}
	Friend* friend = (Friend*)[friends objectAtIndex:indexPath.row];
	cell.textLabel.text = friend.username;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"姓名:%@\nemail:%@\n电话%@\n地址:%@"
								 ,friend.realName, friend.email, friend.phone, friend.address];
	return cell;
}

//delegate

//override
-(void) httpError {
	[indicator stopAnimating];
	[super httpError];
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

-(void)viewWillAppear:(BOOL)animated {
	self.tabBarController.navigationItem.title = @"搜索好友";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


@end
