//
//  ZHUTableViewController.h
//  zhukxContact
//
//  Created by zhukx on 6/20/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHUTableViewController : ZHUViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) UITableView *contactTable;
@end
