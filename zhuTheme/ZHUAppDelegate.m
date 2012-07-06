//
//  ZHUAppDelegate.m
//  zhukxContact
//
//  Created by zhukx on 6/20/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "ZHUAppDelegate.h"

#import "ZHUTableViewController.h"
@interface ZHUAppDelegate ()
- (void)initNotification;
@end

@implementation ZHUAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

#pragma - life cyle
- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initNotification];
    
    
    self.window = [[[ZHUWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ZHUTableViewController alloc] initWithNibName:@"ZHUViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma - init method
- (void)initNotification {
    [[NSNotificationCenter defaultCenter] addObserverForName:kNotifyShake
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note){
        [[ZHUThemeMgr defaultThemeMgr] changeNextTheme];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotifyChangeTheme
                                                            object:nil];
    }];
}
@end
