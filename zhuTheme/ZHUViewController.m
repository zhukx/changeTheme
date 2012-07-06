//
//  ZHUViewController.m
//  zhukxContact
//
//  Created by zhukx on 6/24/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "ZHUViewController.h"

@interface ZHUViewController ()
- (void)changeTheme:(NSString *)themeName;
@end

@implementation ZHUViewController
#pragma - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserverForName:kNotifyShake
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note){
                                                      NSString *themeName = [note.userInfo objectForKey:kNotifyKeyTheme];
                                                      [self changeTheme:themeName];
                                                  }]; 
    _bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _bgImgView.image = [[ZHUThemeMgr defaultThemeMgr] resourceForKey:@"bg.png"];
    [self.view addSubview:_bgImgView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [_bgImgView release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - change theme
- (void)changeTheme:(NSString *)themeName
{
    
}
@end
