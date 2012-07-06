//
//  zhuTests.m
//  zhuTests
//
//  Created by zhukx on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "zhuTests.h"

@implementation zhuTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testThememgr
{
    UIImage *image = [[ZHUThemeMgr defaultThemeMgr] resourceForKey:@"bg.png"];
    STAssertNotNil(image, @"Fail to get image");
    
    //NSData *data = [[ZHUThemeMgr defaultThemeMgr] resourceForKey:@"0.aif"];
    //STAssertNotNil(data, @"Fail to get image");
    
    NSString *themeName = @"pink";
    [[ZHUThemeMgr defaultThemeMgr] changeTheme:themeName];
    
    STAssertEqualObjects(themeName, [[ZHUThemeMgr defaultThemeMgr] curName], @"Fail to save configuration");    
}

- (void)testConfigmgr
{
    NSString *key = @"testkey";
    NSString *value = @"testvalue";
    [[ZHUConfigMgr defaultConfigMgr] setValue:value forKey:key];
    NSString *saved = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    STAssertEqualObjects(saved, value, @"Fail to save configuration");
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];    
    [[NSUserDefaults standardUserDefaults] synchronize];
    saved = [[ZHUConfigMgr defaultConfigMgr] valueForKey:key];    
    STAssertEqualObjects(saved, value, @"Fail to save configuration");
}
@end
