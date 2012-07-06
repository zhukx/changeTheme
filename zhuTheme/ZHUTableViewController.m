//
//  ZHUTableViewController.m
//  zhukxContact
//
//  Created by zhukx on 6/20/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "ZHUTableViewController.h"

@interface ZHUTableViewController ()

@end

@implementation ZHUTableViewController
@synthesize contactTable = _contactTable;

#pragma - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _contactTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _contactTable.dataSource = self;
    _contactTable.delegate = self;
    _contactTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contactTable];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc 
{
    [_contactTable release];
    [super dealloc];
}

#pragma - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idetifier = @"ZHUCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier] autorelease];
    }
    cell.textLabel.text = @"123";
    return cell;
}

#pragma - change theme
- (void)changeTheme:(NSString *)themeName
{
    UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[[ZHUThemeMgr defaultThemeMgr] resourceForKey:@"bg.png"]];

    self.contactTable.backgroundView = bgImgView;
    [bgImgView release];
}
@end
