//
//  ZHUThemeMgr.m
//  zhukxContact
//
//  Created by zhukx on 6/24/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "ZHUThemeMgr.h"
@interface ZHUThemeMgr ()
- (NSString *)haveImg:(BOOL *)result;
- (NSString *)haveSound:(BOOL *)result;
@end

@implementation ZHUThemeMgr
+ (id)defaultThemeMgr {
    static ZHUThemeMgr *sharedMgr = nil;
    if (!sharedMgr) {
        sharedMgr = [[ZHUThemeMgr alloc] init];
    }
    return sharedMgr;
}

- (id)init {
    if (self = [super init]) {
        NSLog(@"%@", [NSBundle mainBundle].resourcePath);
        NSString *themeslistPath = [[NSBundle mainBundle] pathForResource:@"themes" ofType:@"plist"];
        _themesDic = [[NSDictionary alloc] initWithContentsOfFile:themeslistPath];
        _themeArr = [[_themesDic allKeys] retain];
        NSString *savedTheme = [[ZHUConfigMgr defaultConfigMgr] valueForKey:kConfigKeyTheme];
        if (!savedTheme.length) {
            _index = 0;
            _themeName = [[_themeArr objectAtIndex:_index] copy];
        }
        else {
            _themeName = [savedTheme copy];
            _index = [_themeArr indexOfObject:_themeName];
            [[ZHUConfigMgr defaultConfigMgr] setValue:_themeName forKey:kConfigKeyTheme];
        }
        
        NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
        _themePath = [[bundlePath stringByAppendingPathComponent:[_themesDic objectForKey:_themeName]] copy];
    }
    return self;
}

- (NSString *)haveImg:(BOOL *)result {
    NSString *imgPath = [_themePath stringByAppendingPathComponent:@"image"];
    if (!imgPath || 
        ![[NSFileManager defaultManager] fileExistsAtPath:imgPath]) {
        *result = NO;
    }
    else {
        *result = YES;
    }
    return imgPath;
}

- (NSString *)haveSound:(BOOL *)result {

    NSString *soundPath = [_themePath stringByAppendingPathComponent:@"sound"];
    if (!soundPath ||
        ![[NSFileManager defaultManager] fileExistsAtPath:soundPath]) {
        *result = NO;
    }
    else {
        *result = YES;
    }
    return soundPath;
}

- (id)resourceForKey:(NSString *)key {
    NSString *filePath = nil;
    BOOL bResult;
    id rtData = nil;
    if ([key hasSuffix:@"png"] || [key hasSuffix:@"jpg"]) {
        filePath = [self haveImg:&bResult];   
        filePath = [filePath stringByAppendingPathComponent:key];
        if (bResult && filePath.length) {
            rtData = [UIImage imageWithContentsOfFile:filePath];
         }
    }
    else if ([key hasSuffix:@"aif"]) {
        filePath = [self haveSound:&bResult];
        filePath = [filePath stringByAppendingPathComponent:key];
        if (bResult && filePath.length) {
            rtData = [NSData dataWithContentsOfFile:filePath];
        }
    }
    return rtData;
}

- (NSString *)curName {
    return _themeName;
}

- (void)changeNextTheme {
    _index = (_index + 1) % _themeArr.count;
    NSString *themeName = [_themeArr objectAtIndex:_index];
    [self changeTheme:themeName];
}

- (void)changePreTheme {
    _index = (_index - 1) % _themeArr.count;
    NSString *themeName = [_themeArr objectAtIndex:_index];
    [self changeTheme:themeName];
}

- (void)changeTheme:(NSString *)name {
    [_themeName release];
    _themeName = [name copy];
    [[ZHUConfigMgr defaultConfigMgr] setValue:_themeName forKey:kConfigKeyTheme];
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    [_themePath release];
    _themePath = [[bundlePath stringByAppendingPathComponent:[_themesDic objectForKey:_themeName]] copy];
}

- (void)dealloc {
    [_themesDic release];
    [_themeName release];
    [_themePath release];
    [_themeArr release];
    [super dealloc];
}
@end

